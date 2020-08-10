require './spec/graphql_api/trendscope/support/graphql_data_service'

module GraphqlHelpers
  class << self

    def gql(query)
      query
    end

    def schema_by_type(type_name)
      GraphqlDataService.graphql_schema['types'].find do |type|
        type if type['name'].eql?(type_name)
      end
    end

    def pipeline_by_name (json, name)
      json.find do |type|
        return type['id'] if type['name'].eql?(name)
      end
    end

    def report_by_name (json, name)
      json.find do |type|
        return type['id'] if type['name'].eql?(name)
      end
    end

    def step_by_type (json, step_type)
      json['steps'].find do |type|
        type if type['type'].eql?(step_type)
      end
    end

    def graphql_schema_data(field_name, type)
      schema_by_type(field_name)[type].delete_if { |x| x['isDeprecated'].eql? true }.collect { |x| x['name'] }
    end

    def local_fields(definitions)
      definitions.map { |x| x[:property_name] }
    end

    def random_number(definitions)
      rand(1..local_fields(definitions).count)
    end

    def property_definition(definitions)
      definitions.sample(random_number(definitions))
    end

    def filtered_definitions(definitions, type)
      definitions.map { |query| query[type] }
    end

    def definition_attribute(definitions, attribute)
      property_definition(definitions).collect do |query|
        query[attribute]
      end
    end

    def sentiment_matcher(sentiment)
      if sentiment == 'POSITIVE_SENTIMENT'
        '1'
      elsif sentiment == 'NEUTRAL_SENTIMENT'
        '0'
      elsif sentiment == 'NEGATIVE_SENTIMENT'
        '-1'
      end
    end

    def find_sentiment(array, val)
      array.flatten.flatten.select { |a| a['key'] == val }
    end

    def get_total_value(json, type)
      JsonPath.on(find_sentiment(JsonPath.on(json, '$..["sentiment"]'), sentiment_matcher(type)), '$..["value"]["totalValue"]')
    end
  end
end
