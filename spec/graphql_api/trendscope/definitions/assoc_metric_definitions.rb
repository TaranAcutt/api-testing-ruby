require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/common_definitions'

module AssocMetricDefinitions
  class << self
    attr_accessor :association_metric, :rand_association_metric, :association, :associated, :rand_associated, :rand_association,
                  :association_count,  :rand_association_count
  end
  
  @associated = [
    {
      query: 'liftTotalValue',
      property_name: 'liftTotalValue',
      schema: {
        liftTotalValue: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'subLens',
      property_name: 'subLens',
      schema: {
        subLens: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]
  
  @rand_associated = GraphqlHelpers.property_definition(@associated)
  
  @association = [
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
    }
  ]
  
  @rand_association = GraphqlHelpers.property_definition(@association)
  
  @association_count = [
    {
      query: 'association { ' + GraphqlHelpers.filtered_definitions(@association, :query).join(' ') + ' }',
      property_name: 'association',
      schema: {
        association: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(@association, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(@association, :schema).reduce(&:merge)
        }
      }
    },
    {
      query: 'count',
      property_name: 'count',
      schema: {
        count: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    }
  ]
  
  @rand_association_count = GraphqlHelpers.property_definition(@association_count)
  
  @association_metric = [
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
      query: 'lift { ' + GraphqlHelpers.filtered_definitions(Common.lift_time_series, :query).join(' ') + ' }',
      property_name: 'lift',
      schema: {
        lift: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(Common.lift_time_series, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(Common.lift_time_series, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'period',
      property_name: 'period',
      schema: {
        period: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/time_unit.json"
        }
      }
    },
    {
      query: 'volume { ' + GraphqlHelpers.filtered_definitions(Common.int_time_series, :query).join(' ') + ' }',
      property_name: 'volume',
      schema: {
        volume: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(Common.int_time_series, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(Common.int_time_series, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'netSentiment { ' + GraphqlHelpers.filtered_definitions(Common.int_time_series, :query).join(' ') + ' }',
      property_name: 'netSentiment',
      schema: {
        netSentiment: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(Common.int_time_series, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(Common.int_time_series, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'association { ' + GraphqlHelpers.filtered_definitions(@association, :query).join(' ') + ' }',
      property_name: 'association',
      schema: {
        association: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@association, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(@association, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'sentiment { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'sentiment',
      schema: {
        sentiment: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    }
  ]
  
  @rand_association_metric = GraphqlHelpers.property_definition(AssocMetricDefinitions.association_metric)
end
