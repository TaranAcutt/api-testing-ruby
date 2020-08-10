require './spec/graphql_api/trendscope/support/graphql_helpers'

module DemographicsMetricDefinitions
  class << self
    attr_accessor :demographic_metric, :demographics_metrics, :demographic_category, :rand_demographic_metrics
  end
  
  @demographic_category = [
    {
      query: 'code',
      property_name: 'code',
      schema: {
        code: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
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
      query: 'average',
      property_name: 'average',
      schema: {
        average: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
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
    },
    {
      query: 'from',
      property_name: 'from',
      schema: {
        from: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    }
  ]
  
  @category = GraphqlHelpers.property_definition(@demographic_category)

  @demographic_metric = [
    {
      query: 'category { ' + GraphqlHelpers.filtered_definitions(@category, :query).join(' ') + ' }',
      property_name: 'category',
      schema: {
        category: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(@category, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(@category, :schema).reduce(&:merge)
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
      query: 'actualSize',
      property_name: 'actualSize',
      schema: {
        actualSize: {
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
    }
  ]

  @metric = GraphqlHelpers.property_definition(@demographic_metric)


  @demographics_metrics = [
    {
      query: 'accountsFollowed { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' }}',
      property_name: 'accountsFollowed',
      schema: {
        accountsFollowed: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'ageCensus { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' }}',
      property_name: 'ageCensus',
      schema: {
        ageCensus: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'ageNielsen { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' }}',
      property_name: 'ageNielsen',
      schema: {
        ageNielsen: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'brands { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' }}',
      property_name: 'brands',
      schema: {
        brands: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'familyStatus { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' }}',
      property_name: 'familyStatus',
      schema: {
        familyStatus: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'gender { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'gender',
      schema: {
        gender: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'hashtags { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'hashtags',
      schema: {
        hashtags: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'influences { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'influences',
      schema: {
        influences: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'likesAndInterests { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'likesAndInterests',
      schema: {
        likesAndInterests: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'locationByCity { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'locationByCity',
      schema: {
        locationByCity: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'locationByCountry { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'locationByCountry',
      schema: {
        locationByCountry: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'locationByUSState { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'locationByUSState',
      schema: {
        locationByUSState: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'nativeLanguage { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'nativeLanguage',
      schema: {
        nativeLanguage: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'numberOfFollowers { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'numberOfFollowers',
      schema: {
        numberOfFollowers: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'occupations { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'occupations',
      schema: {
        occupations: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'personalIncome { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'personalIncome',
      schema: {
        personalIncome: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'raceUSOnly { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'raceUSOnly',
      schema: {
        raceUSOnly: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'religion { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'religion',
      schema: {
        religion: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'timeOnNetwork { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'timeOnNetwork',
      schema: {
        timeOnNetwork: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'postingFrequency { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'postingFrequency',
      schema: {
        postingFrequency: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    },
    {
      query: 'networkSettings { nodes  { ' + GraphqlHelpers.filtered_definitions(@metric, :query).join(' ') + ' } }',
      property_name: 'networkSettings',
      schema: {
        networkSettings: {
          type: 'object',
          required: %w'nodes',
          properties: {
            nodes: {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@metric, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@metric, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    }
  ]

  @rand_demographic_metrics = GraphqlHelpers.property_definition(@demographics_metrics)
end
