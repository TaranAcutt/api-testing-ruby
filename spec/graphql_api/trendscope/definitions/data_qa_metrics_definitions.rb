require './spec/graphql_api/trendscope/support/graphql_helpers'

module DataQaMetricsDefinitions
  class << self
    attr_accessor :qa_demographics, :rand_qa_demographics, :qa_low_volumes, :rand_qa_low_volumes,
                  :qa_demographics_sublens, :qa_low_volumes_sublens
  end
  
  @qa_demographics_sublens = [
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
      query: 'market',
      property_name: 'market',
      schema: {
        market: {
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
      query: 'tpvRank',
      property_name: 'tpvRank',
      schema: {
        tpvRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    }
  ]
  
  @rand_qa_demographics_sublens = GraphqlHelpers.property_definition(@qa_demographics_sublens)

  @qa_demographics = [
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
      query: 'market',
      property_name: 'market',
      schema: {
        market: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'subLensCount',
      property_name: 'subLensCount',
      schema: {
        subLensCount: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'subLenses { ' + GraphqlHelpers.filtered_definitions(@qa_demographics_sublens, :query).join(' ') + ' }',
      property_name: 'subLenses',
      schema: {
        subLenses: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@qa_demographics_sublens, :property_name),
                    properties: GraphqlHelpers.filtered_definitions(@qa_demographics_sublens, :schema).reduce(&:merge)
                  },
                  {
                    type: 'null'
                  }
                ]
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

  @rand_qa_demographics = GraphqlHelpers.property_definition(@qa_demographics)
  
  @qa_low_volumes_sublens = [
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
      query: 'market',
      property_name: 'market',
      schema: {
        market: {
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
      query: 'tpvRank',
      property_name: 'tpvRank',
      schema: {
        tpvRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'volume',
      property_name: 'volume',
      schema: {
        volume: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    }
  ]
  
  @rand_qa_low_volumes_sublens = GraphqlHelpers.property_definition(@qa_low_volumes_sublens)

  @qa_low_volumes = [
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
      query: 'market',
      property_name: 'market',
      schema: {
        market: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'subLensCount',
      property_name: 'subLensCount',
      schema: {
        subLensCount: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'subLenses { ' + GraphqlHelpers.filtered_definitions(@qa_low_volumes_sublens, :query).join(' ') + ' }',
      property_name: 'subLenses',
      schema: {
        subLenses: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@qa_low_volumes_sublens, :property_name),
                    properties: GraphqlHelpers.filtered_definitions(@qa_low_volumes_sublens, :schema).reduce(&:merge)
                  },
                  {
                    type: 'null'
                  }
                ]
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

  @rand_qa_low_volumes = GraphqlHelpers.property_definition(@qa_low_volumes)
end