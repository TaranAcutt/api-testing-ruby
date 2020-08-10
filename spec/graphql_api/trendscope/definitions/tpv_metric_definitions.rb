require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/common_definitions'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module TpvMetricDefinitions
  class << self
    attr_accessor :tpv_metric, :rand_tpv_metric, :meta, :rand_meta, :overview, :rand_overview, :trend_metrics, :rand_trend_metrics, :cluster, :rand_cluster,
      :tpv_demographics_metrics, :rand_tpv_demographics_metrics, :tpv_demographics_metric, :rand_tpv_demographics_metric, :tpv_demographics_category
  end
  
  @cluster = [
    {
      query: 'centrality',
      property_name: 'centrality',
      schema: {
        centrality: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'cluster',
      property_name: 'cluster',
      schema: {
        cluster: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]
  
  @rand_cluster = GraphqlHelpers.property_definition(@cluster)
  
  @tpv_demographics_category = [
    {
      query: 'average',
      property_name: 'average',
      schema: {
        average: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'from',
      property_name: 'from',
      schema: {
        from: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'subcategory',
      property_name: 'subcategory',
      schema: {
        subcategory: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'to',
      property_name: 'to',
      schema: {
        to: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    }
  ]
  
  @rand_tpv_demographics_category = GraphqlHelpers.property_definition(@tpv_demographics_category)
  
  @tpv_demographics_metric = [
    {
      query: 'actualSize',
      property_name: 'actualSize',
      schema: {
        actualSize: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'category {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_category, :query).join(' ') + '}',
      property_name: 'category',
      schema: {
        category: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_category, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_category, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'demographicsIndex',
      property_name: 'demographicsIndex',
      schema: {
        demographicsIndex: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'estimatedSize',
      property_name: 'estimatedSize',
      schema: {
        estimatedSize: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'percentage',
      property_name: 'percentage',
      schema: {
        percentage: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'sectionName',
      property_name: 'sectionName',
      schema: {
        sectionName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
  ]
  
  @rand_tpv_demographics_metric = GraphqlHelpers.property_definition(@tpv_demographics_metric)
  
  @tpv_demographics_metrics = [
    {
      query: 'D01 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'D01',
      schema: {
        D01: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'D02 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'D02',
      schema: {
        D02: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'D03 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'D03',
      schema: {
        D03: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'D04 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'D04',
      schema: {
        D04: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'D09 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'D09',
      schema: {
        D09: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G01 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G01',
      schema: {
        G01: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G02 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G02',
      schema: {
        G02: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G03 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G03',
      schema: {
        G03: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G04 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G04',
      schema: {
        G04: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G05 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G05',
      schema: {
        G05: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G06 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G06',
      schema: {
        G06: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G07 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G07',
      schema: {
        G07: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G08 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G08',
      schema: {
        G08: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G09 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G09',
      schema: {
        G09: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G11 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G11',
      schema: {
        G11: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G12 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G12',
      schema: {
        G12: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G13 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G13',
      schema: {
        G13: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G14 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G14',
      schema: {
        G14: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G15 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G15',
      schema: {
        G15: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G16 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G16',
      schema: {
        G16: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G17 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G17',
      schema: {
        G17: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G18 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G18',
      schema: {
        G18: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'G19 {' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :query).join(' ') + '}',
      property_name: 'G19',
      schema: {
        G19: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :property_name),
              properties: GraphqlHelpers.filtered_definitions(@tpv_demographics_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
  ]
  
  @rand_tpv_demographics_metrics = GraphqlHelpers.property_definition(@tpv_demographics_metrics)
  
  @trend_metrics = [
    {
      query: 'tpvRank',
      property_name: 'tpvRank',
      schema: {
        tpvRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'tpvPreviousRank',
      property_name: 'tpvPreviousRank',
      schema: {
        tpvPreviousRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'tpvRankChange',
      property_name: 'tpvRankChange',
      schema: {
        tpvRankChange: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'tpvScore',
      property_name: 'tpvScore',
      schema: {
        tpvScore: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'volume',
      property_name: 'volume',
      schema: {
        volume: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'yoyGrowth',
      property_name: 'yoyGrowth',
      schema: {
        yoyGrowth: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'volumeTrans',
      property_name: 'volumeTrans',
      schema: {
        volumeTrans: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'pastGrowth',
      property_name: 'pastGrowth',
      schema: {
        pastGrowth: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'pastGrowthTrans',
      property_name: 'pastGrowthTrans',
      schema: {
        pastGrowthTrans: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'growthType',
      property_name: 'growthType',
      schema: {
        growthType: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'forecast6Months',
      property_name: 'forecast6Months',
      schema: {
        forecast6Months: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'phase',
      property_name: 'phase',
      schema: {
        phase: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/trend_metrics_phase.json"
        }
      }
    },
    {
      query: 'prevRelDist',
      property_name: 'prevRelDist',
      schema: {
        prevRelDist: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    }
  ]
  
  @rand_trend_metrics = GraphqlHelpers.property_definition(@trend_metrics)
  
  @tpv_metric = [
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
      query: 'period',
      property_name: 'period',
      schema: {
        period: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/time_unit.json"
        }
      }
    },
    {
      query: 'demographics { ' + GraphqlHelpers.filtered_definitions(@tpv_demographics_metrics, :query).join(' ') + ' }',
      property_name: 'demographics',
      schema: {
        demographics: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@tpv_demographics_metrics, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(@tpv_demographics_metrics, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'competitors { ' + GraphqlHelpers.filtered_definitions(Common.int_time_series, :query).join(' ') + ' }',
      property_name: 'competitors',
      schema: {
        competitors: {
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
      query: 'countries { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'countries',
      schema: {
        countries: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'languages { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'languages',
      schema: {
        languages: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'sentiment { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series_with_percent, :query).join(' ') + ' }',
      property_name: 'sentiment',
      schema: {
        sentiment: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series_with_percent, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series_with_percent, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'sources { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'sources',
      schema: {
        sources: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties: GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'retweets { ' + GraphqlHelpers.filtered_definitions(Common.int_time_series, :query).join(' ') + ' }',
      property_name: 'retweets',
      schema: {
        retweets: {
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
      query: 'reach { ' + GraphqlHelpers.filtered_definitions(Common.int_time_series, :query).join(' ') + ' }',
      property_name: 'reach',
      schema: {
        reach: {
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
      query: 'shareOfVoice { ' + GraphqlHelpers.filtered_definitions(Common.float_time_series, :query).join(' ') + ' }',
      property_name: 'shareOfVoice',
      schema: {
        shareOfVoice: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(Common.float_time_series, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(Common.float_time_series, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
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
      query: 'trendMetrics { ' + GraphqlHelpers.filtered_definitions(@trend_metrics, :query).join(' ') + ' }',
      property_name: 'trendMetrics',
      schema: {
        trendMetrics: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@trend_metrics, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(@trend_metrics, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'topAssociations(reportId: "' + GraphqlDataService.report_id + '"){ id }',
      property_name: 'topAssociations',
      schema: {
        topAssociations: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: %w'id',
                properties: {
                  id: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
                  }
                }
              }
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'clusters { ' + GraphqlHelpers.filtered_definitions(cluster, :query).join(' ') + ' }',
      property_name: 'clusters',
      schema: {
        clusters: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(cluster, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(cluster, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'netSentimentPercent',
      property_name: 'netSentimentPercent',
      schema: {
        netSentimentPercent: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'topClusterAssociations(count: 10) { ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :query).join(' ') + ' }',
      property_name: 'topClusterAssociations',
      schema: {
        topClusterAssociations: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :property_name),
                properties: GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :schema).reduce(&:merge)
              }
            },
            {
              type: 'type'
            }
          ]
        }
      }
    },
    {
      query: 'lowVolume',
      property_name: 'lowVolume',
      schema: {
        lens: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    }
  ]
  
  @rand_tpv_metric = GraphqlHelpers.property_definition(@tpv_metric)
  
  @overview = [
    {
      query: 'subLens',
      property_name: 'subLens',
      schema: {
        subLens: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'phase',
      property_name: 'phase',
      schema: {
        phase: {
          oneOf: [
            {
              '$ref': "#{SchemaHelpers.schemas}/trendscope/trend_metrics_phase.json"
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'tpvScore',
      property_name: 'tpvScore',
      schema: {
        tpvScore: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'tpvRank',
      property_name: 'tpvRank',
      schema: {
        tpvRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'tpvPreviousRank',
      property_name: 'tpvPreviousRank',
      schema: {
        tpvPreviousRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'netSentiment',
      property_name: 'netSentiment',
      schema: {
        netSentiment: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'prevRelDist',
      property_name: 'prevRelDist',
      schema: {
        prevRelDist: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'tpvRankChange',
      property_name: 'tpvRankChange',
      schema: {
        tpvPreviousRank: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    }
  ]
  
  @rand_overview = GraphqlHelpers.property_definition(@overview)
  
  @meta = [
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
      query: 'volSplit',
      property_name: 'volSplit',
      schema: {
        volSplit: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'declining',
      property_name: 'declining',
      schema: {
        declining: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'growing',
      property_name: 'growing',
      schema: {
        growing: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    }
  ]
  
  @rand_meta = GraphqlHelpers.property_definition(@meta)
end
