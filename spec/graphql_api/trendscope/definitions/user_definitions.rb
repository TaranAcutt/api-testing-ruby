require './spec/graphql_api/trendscope/support/graphql_helpers'

module UserDefinitions
  class << self
    attr_accessor :user, :rand_user, :organisation, :ran_organisation
  end
  
  @organisation = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'logoUrl',
      property_name: 'logoUrl',
      schema: {
        logoUrl: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'reportClientName',
      property_name: 'reportClientName',
      schema: {
        email: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    }
  ]
  
  @ran_organisation = GraphqlHelpers.property_definition(@organisation)
  
  @user = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'username',
      property_name: 'username',
      schema: {
        username: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'email',
      property_name: 'email',
      schema: {
        email: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'organisations { ' + GraphqlHelpers.filtered_definitions(@organisation, :query).join(' ') + ' }',
      property_name: 'organisations',
      schema: {
        'organisations': {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(@organisation, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(@organisation, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'roles',
      property_name: 'roles',
      schema: {
        roles: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
          }
        }
      }
    },
    {
      query: 'isSuperUser',
      property_name: 'isSuperUser',
      schema: {
        isSuperUser: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    }
  ]
  
  @rand_user = GraphqlHelpers.property_definition(@user)
end