# Running with Docker

## Single command

`DEBUG=true CONFIG_FILE=stage envsubst < env.tpl > env.env && docker-compose up`

## Details

You must create a file in the root of this project called "env.env" containing the following variables.
You may create the file manually or use "envsubst" from the "env.tpl" file as follows:

`DEBUG=true CONFIG_FILE=stage envsubst < env.tpl > env.env`

env.env
```
DEBUG=true
CONFIG_FILE=stage
SPEC=spec/user
```

## Specs

#### Data integrity
Tests covering Data integrity tests for the following sources - 
+ Twitter
+ Facebook
+ Youtube
+ Google analytics
+ Google webmasters

#### Middleware tests
Tests covering the following Middleware APIs -
+ Accounts 
+ Data
+ Data source admin
+ Positioning machine 

##### Testing method

For each endpoint there is a defined schema, as can be seen below.

##### Schema
```json
    {
      "type": "object",
      "required": [
        "id",
        "name",
        "route",
        "application_type",
        "legacy_key"
      ],
      "properties": {
        "id": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "route": {
          "type": "string"
        },
        "menu_id": {
          "type": "integer"
        },
        "settings_id": {
          "type": "integer"
        },
        "application_type": {
          "type": "string"
        },
        "legacy_key": {
          "type": "string"
        }
      }
    }
```

This is then matched against API response.

##### Test example
```ruby
    context 'expand' do
      ExpansionDefinitions.app_tests.each do |expansions|
        context ExpansionHelpers.context_name expansions do
          before(:context) do
            @json, @request = get(Config.accounts,
                                  "applications/#{MiddlewareDataService.application_id}?debug#{ExpansionHelpers.expand_query(expansions)}",
                                  authorization: MiddlewareAuthTokens.middleware)
          end

          after(:example) do |example|
            response_upon_error(@json) if example.exception
          end

          context 'response validity' do
            it 'returns OK (200) status code' do
              expect(@request.code).to eq 200
            end

            it 'returns content_type json' do
              expect(@request.headers[:content_type]).to start_with 'application/json'
            end

            it 'conforms to singular response' do
              expect(@json).to match_schema("#{SchemaHelpers.schemas}/support/singular_response.json")
            end

            it 'data conforms to application schema' do
              expect(@json['data']).to match_schema_with_expansions("#{SchemaHelpers.schemas}/accounts/application.json", expansions, ExpansionDefinitions.app_definitions)
            end
          end
        end
      end
    end
```    

Some endpoints allow a user to expand upon certain fields, so in order to test this, the following has been written.

##### Expansion definitions
```ruby
module ExpansionDefinitions
  class << self
    attr_accessor :app_definitions, :app_tests
  end
  
  @app_tests = [
    [],
    %w(menu),
    %w(settings),
    %w(settings menu),
  
  ]
  
  @app_definitions = [
    {
      property: 'menu',
      schema: {
        type: 'object',
        items: {
          '$ref': "#{SchemaHelpers.schemas}/accounts/menu.json"
        }
      },
      required: [
        'menu'
      ]
    },
    {
      property: 'settings',
      schema: {
        type: 'object',
        items: {
          '$ref': "#{SchemaHelpers.schemas}/accounts/settings.json"
        }
      },
      required: [
        'settings'
      ]
    }
  ]
end
```

This provides a list of possible fields that can be expanded, as well as the expected schema for the said expanded field. This is reflected in the test above and the snippers below. 
```ruby
    context 'expand' do
    #method of iterating through list of fields with expansion available
      ExpansionDefinitions.app_tests.each do |expansions|
        context ExpansionHelpers.context_name expansions do
          before(:context) do
            @json, @request = get(Config.accounts,
                                  "applications/#{MiddlewareDataService.application_id}?debug#{ExpansionHelpers.expand_query(expansions)}",
                                  authorization: MiddlewareAuthTokens.middleware)
          end

            #test to match expanded field with stored schema
            it 'data conforms to application schema' do
              expect(@json['data']).to match_schema_with_expansions("#{SchemaHelpers.schemas}/accounts/application.json", expansions, ExpansionDefinitions.app_definitions)
            end
          end
        end
      end  
```

This covers the basics of each request, with individual tests covering the wider functionality of each endpoint.



#### Graphql tests
Tests covering the following Graphql APIs
+ Trendscope 
##### Testing method

For each graphql object a definition is created. This contains the following items.
+ Query fragment
+ Property name
+ Schema

##### Definitions
```ruby
  [
    {
      query: 'category',
      property_name: 'category',
      schema: {
        category: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'lens',
      property_name: 'lens',
      schema: {
        lens: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'subLens',
      property_name: 'subLens',
      schema: {
        subLens: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'filter { query type }',
      property_name: 'filter',
      schema: {
        filter: {
          oneOf: [
            {
              type: 'object',
              required: %w'query type',
              properties: {
                query: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                },
                type: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                }
              }
            },
            {
              type: 'null'
            }
          ]
        }
      }
    }
  ]
```
    
The query strings shown are then merged passed, either in their entirety or selected randomly, into the query below, using the filter definitions_method.

##### Query builder     
```ruby
  def self.pipeline_query (definition)
    { query:
      '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          ' + Support.filtered_definitions(definition, :query).join(' ') + '
        }
      }'
    } 
  end    
```  
The same is then done for the dynamic schema, using the schema from the same fields returned from the filtered_definitions method.

##### Schema builder
```ruby
  def self.pipeline_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipeline'],
          properties: {
            pipeline: {
              type: 'object',
              required: Support.filtered_definitions(definition, :property_name),
              properties:
                Support.filtered_definitions(definition, :schema).reduce(&:merge)
            }
          }
        }
      }
    }
  end  
```  
  
This all comes together in the test as per below, with the query being passed in, and the expected schema then expected to match the response.

##### Rspec test
```ruby
    context 'all fields' do
      before(:context) do
        @json, @req = post(Config.graphql,
                           'graphql',
                           PipelineQueries.pipeline_query(PipelineDefinitions.pipeline).to_json,
                           Authorization: GraphqlAuthTokens.graphql)
      end
      
      after(:example) do |example|
        response_upon_error(@json) if example.exception
      end
      
      it 'returns OK (200) status code' do
        expect(@req.code).to eq 200
      end
      
      it 'data conforms to pipeline schema' do
        expect(@json).to match_schema(PipelineSupport.pipeline_schema(PipelineDefinitions.pipeline))
      end
      
      it 'returns a response without errors' do
        expect(@json['errors']).to be_nil
      end
    end
```  

This approach was taken for the following reasons:
+ **Maintainability** - The definitions for each object are written once, with common objects being separated and reused. 
                    The queries and schema are also dynamic to a point, avoiding dozens of different variations for each test.
                        
+ **Flexibility** - The above approach was designed to allow two types of tests, one where all fields on an object are requested in a query
                and one where a random number of fields are selected, shuffled and then put into the query. Because all of the information
                needed to do build queries and schemas is readily available, it leaves room to manipulate the data in any way required.
                
+ **Reliability** - To ensure that the definitions remain up to date, tests have been written for every object that compares the definitions stored
                locally against those returned via the graphql schema. So will then return an error if there are any new fields, which subsequently can be added to the definitions.
                
+ **Readability** - The decision to create fixed definitions rather than using the data from the a graphql schema was chosen mainly for readabilities sake. Manipulating the graphql schema
                    directly also would obscure the testers visibility of any changes made. For example, there have been instances of incorrect types returning from the graphql schema.
                    While this can be mitigated by proper processes for changes being in place, this isn't always the case and leaves an element of risk.
                     
+ **Predictability**  - This method is also relatively straight forward compared with the alternative of using the graphql schema. For example, If I were to build a query using a field that has children, I would need to select at least one of those children. 
                        I would then need to ensure the selected field does not include children itself to avoid going further down the tree than required.                    
                                                                             
## Variable explanation

#### DEBUG
Show all debugging output

#### CONFIG_FILE
Name of file lib/CONFIG_FILE/{name}.json

#### SPEC
Explicit spec to run, or leave blank to run all

## Run

`docker-compose up`

## Fixtures

Fixture create is run at the beginning of a test run and fixture delete at the end.

This adds test data that is client agnostic.

Below are the fixture details

##Clients

    {
         "id": "QAFIXTURE1",
         "name": "QA fixture 1",
         "email": "Enter client email address for alerts...",
         "settings": {},
         "socialnaut_key": "559bf73619a81738a76a78d9"
        },
        {
         "id": "QAFIXTURE2",
         "name": "QA fixture 2",
         "email": "Enter client email address for alerts...",
         "settings": {},
         "socialnaut_key": "559bf73619a81738a76a78d9"
    }

##Client brand group types 

    {
          "id": "QAFIXTURE1MAIN",
          "name": "Main",
          "brandGroup_type": "MAIN",
          "childIds": [ "QAFIXTURE1CAMPAIGN" ],
          "clientId": "QAFIXTURE1",
          "allowMonitors": false,
          "previouslySubclient": false
        },
        {
          "id": "QAFIXTURE1CAMPAIGN",
          "name": "Campaign",
          "brandGroupType": "CAMPAIGN",
          "clientId": "QAFIXTURE1",
          "allowMonitors": true,
          "previouslySubclient": false
        },
        {
          "id": "QAFIXTURE2MAIN",
          "name": "Main",
          "brandGroup_type": "MAIN",
          "childIds": [ "QAFIXTURE2CAMPAIGN" ],
          "clientId": "QAFIXTURE2",
          "allowMonitors": false,
          "previouslySubclient": false
        },
        {
          "id": "QAFIXTURE2CAMPAIGN",
          "name": "Campaign",
          "brandGroupType": "CAMPAIGN",
          "clientId": "QAFIXTURE2",
          "allowMonitors": true,
          "previouslySubclient": false
        }

##Monitors 

     {
          "id": "QAFIXTURE1WEATHER",
          "name": "London",
          "dimensions": {
            "city": "London",
            "latitude": "51.5073509",
            "longitude": "-0.1277583"
          },
          "data_source_id": "CEFUTLWKTY", << ? WEATHER
          "brand_group_ids": [],
          "client_id": "QAFIXTURE1",
          "custom_queries": []
        },
        {
          "id": "QAFIXTURE2WEATHER",
          "name": "London",
          "dimensions": {
            "city": "London",
            "latitude": "51.5073509",
            "longitude": "-0.1277583"
          },
          "data_source_id": "CEFUTLWKTY", << ? WEATHER
          "brand_group_ids": [],
          "client_id": "QAFIXTURE2",
          "custom_queries": []
        }                
        
##Brand groups 

    {
          "type": "BRAND_GROUP",
          "id": "QAFIXTURE1MAIN",
          "name": "QA fixture 1 main",
          "level": 0,
          "monitor_ids": [],
          "client_id": "QAFIXTURE1",
          "client_brand_group_type_id": "QAFIXTURE1MAIN",
          "permission_ids": []
        },
        {
          "type": "BRAND_GROUP",
          "id": "QAFIXTURE1CAMPAIGN",
          "name": "QA fixture 1 campaign",
          "level": 1,
          "primary": false,
          "parent_id": "QAFIXTURE1MAIN",
          "monitor_ids": [ "QAFIXTURE1WEATHER" ],
          "client_id": "QAFIXTURE1",
          "client_brand_group_type_id": "QAFIXTURE1CAMPAIGN",
          "permission_ids": []
        },
        {
          "type": "BRAND_GROUP",
          "id": "QAFIXTURE1CAMPAIGN2",
          "name": "QA fixture 1 campaign 2",
          "level": 1,
          "primary": false,
          "parent_id": "QAFIXTURE1MAIN",
          "monitor_ids": [ "QAFIXTURE1WEATHER" ],
          "client_id": "QAFIXTURE1",
          "client_brand_group_type_id": "QAFIXTURE1CAMPAIGN",
          "permission_ids": []
        },
        {
          "type": "BRAND_GROUP",
          "id": "QAFIXTURE2MAIN",
          "name": "QA fixture 2 main",
          "level": 0,
          "monitor_ids": [],
          "client_id": "QAFIXTURE2",
          "client_brand_group_type_id": "QAFIXTURE2MAIN",
          "permission_ids": []
        },
        {
          "type": "BRAND_GROUP",
          "id": "QAFIXTURE2CAMPAIGN",
          "name": "QA fixture 2 campaign",
          "level": 1,
          "primary": false,
          "parent_id": "QAFIXTURE2MAIN",
          "monitor_ids": [ "QAFIXTURE2WEATHER" ],
          "client_id": "QAFIXTURE2",
          "client_brand_group_type_id": "QAFIXTURE2CAMPAIGN",
          "permission_ids": []
    }

##Licences 

    {
          "id": "QAFIXTURE1",
          "name": "QA fixture 1 Licence",
          "client_id": "QAFIXTURE1",
          "permission_ids": [
            "??", << WEATHER READ
          ]
        },
        {
          "id": "QAFIXTURE2",
          "name": "QA fixture 2 Licence",
          "client_id": "QAFIXTURE2",
          "permission_ids": [
            "??", << WEATHER READ
          ]
    }

##Permissions 

    {
          "id": "QAFIXTURE1CAMPAIGN",
          "name": "campaign",
          "type": "READ",
          "secure_entity_ids": [ "QAFIXTURE1CAMPAIGN" ],
          "permission_type": "BRAND_GROUP"
        },
        {
          "id": "QAFIXTURE1CAMPAIGN2",
          "name": "campaign 2",
          "type": "READ",
          "secure_entity_ids": [ "QAFIXTURE1CAMPAIGN2" ],
          "permission_type": "BRAND_GROUP"
        },
        {
          "id": "QAFIXTURE2CAMPAIGN",
          "name": "campaign",
          "type": "READ",
          "secure_entity_ids": [ "QAFIXTURE2CAMPAIGN" ],
          "permission_type": "BRAND_GROUP"
    }

##Roles 

    {
          "id": "QAFIXTURE1CLIENT",
          "name": "QA fixture client permission",
          "permission_ids": [],
          "role_type": "CLIENT",
          "permission_type": "CLIENT",
          "client_id": "QAFIXTURE1",
          "view_client_role": true
        },
        {
          "id": "QAFIXTURE1ADMIN",
          "name": "QA fixture admin permission",
          "permission_ids": [],
          "role_type": "CLIENT",
          "permission_type": "CLIENT",
          "client_id": "QAFIXTURE1",
          "client_admin_role": true
        },
        {
          "id": "QAFIXTURE1CAMPAIGN",
          "name": "QA fixture campaign permission",
          "permission_ids": [ "QAFIXTURE1CAMPAIGN" ],
          "role_type": "CLIENT",
          "permission_type": "BRAND_GROUP",
          "client_id": "QAFIXTURE1"
        },
        {
          "id": "QAFIXTURE1DATA",
          "name": "QA fixture data permission",
          "permission_ids": [ ],  < ? WEATHER
          "role_type": "CLIENT",
          "permission_type": "DATA",
          "client_id": "QAFIXTURE1"
    }

##Users 

    {
          "id": "QAFIXTURE1ADMIN",
          "name": "QA fixture 1 admin",
          "username": "qafixture1amin",
          "email": "user1@example.com",
          "role_ids": [
             "QAFIXTURE1ADMIN"
          ],
          "brand_group_ids": [
                "QAFIXTURE1CAMPAIGN"
            ],
          "billing_client_id": "QAFIXTURE1",
        },
        {
          "id": "QAFIXTURE1USER",
          "name": "QA fixture 1 user",
          "username": "qafixture1user",
          "email": "user2@example.com",
          "role_ids": [
             "QAFIXTURE1CLIENT"
             "QAFIXTURE1CAMPAIGN"
          ],
          "billing_client_id": "QAFIXTURE1",
    }

##Client properties

    {
      "id"=>"QAFIXTURE1CP",
      "name"=>"QA fixture 1 client property",
      "type"=>"GOOGLE_CONNECT",
      "values"=>
            {"refreshToken"=>"1/nwQTd6Di9MKzAwB4Pnq6EulXXrqukqT59-12345667979I"},
      "clientId"=>"QAFIXTURE1"
    }
    
## User permissions 
    
    api_tester has:
        both clients includes
        all permissions includes
        all brand_groups
        all monitors
    
    QA fixture 1 admin has:
        QA1 client
        QA1 permissions
        QA1 both brand_groups
        QA1 monitor
    
    QA fixture 1 user has:
        QA1 client
        QA1 view client/brand_group permissions
        QA1 single brand_group
        QA1 monitor
    
    QA fixture 2 admin has:
        QA2 client
        QA2 permissions
        QA2 both brand_groups
        QA2 monitor
    
    QA fixture 2 user has:
        QA2 client
        QA2 view client/brand_group permissions
        QA2 single brand_group
        QA2 monitor




