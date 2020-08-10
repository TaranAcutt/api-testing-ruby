require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/common_definitions'

module VolumeMetricDefinitions
  class << self
    attr_accessor :volume_metric, :rand_volume_metric
  end

  @volume_metric = [
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
      query: 'market',
      property_name: 'market',
      schema: {
        market: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
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
      query: 'volume { ' + GraphqlHelpers.filtered_definitions(Common.int_time_s, :query).join(' ') + ' }',
      property_name: 'volume',
      schema: {
        volume: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(Common.int_time_s, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(Common.int_time_s, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'sources { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'sources',
      schema: {
        sources: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    }
  ]

  @rand_volume_metric = GraphqlHelpers.property_definition(VolumeMetricDefinitions.volume_metric)
end
