require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/common_definitions'

module TpvReportDefinitions
  class << self
    attr_accessor :tpv_report, :rand_tpv_report, :report_section_taxonomies, :rand_report_section_taxonomies, :market_taxonomy_mapping,
                  :rand_market_taxonomy_mapping, :report_association_mapping, :market_pipeline_mapping, :report_meta_data, :rand_report_meta_data,
                  :language_name, :rand_language_name
  end

  @report_meta_data = [
    {
      query: 'month',
      property_name: 'month',
      schema: {
        month: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'reportType',
      property_name: 'reportType',
      schema: {
        reportType: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'year',
      property_name: 'year',
      schema: {
        year: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    }
  ]

  @rand_report_meta_data = GraphqlHelpers.property_definition(@report_meta_data)

  @language_name = [
    {
      query: 'language',
      property_name: 'language',
      schema: {
        language: {
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
    }
  ]

  @rand_language_name = GraphqlHelpers.property_definition(@language_name)

  @market_taxonomy_mapping = [
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
      query: 'taxonomyProjectName',
      property_name: 'taxonomyProjectName',
      schema: {
        taxonomyProjectName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    }
  ]

  @rand_market_taxonomy_mapping = GraphqlHelpers.property_definition(@market_taxonomy_mapping)

  @report_association_mapping = [
    {
      query: 'source { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'source',
      schema: {
        source: {
          type: 'array',
          items: {
            oneOf: [
              {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
              },
              {
                type: 'null'
              }
            ]
          }
        }
      }
    },
    {
      query: 'target { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'target',
      schema: {
        target: {
          type: 'array',
          items: {
            oneOf: [
              {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
              },
              {
                type: 'null'
              }
            ]
          }
        }
      }
    }
  ]

  @rand_report_assoc_mapping = GraphqlHelpers.property_definition(@report_association_mapping)

  @market_pipeline_mapping = [
    {
      query: 'market',
      property_name: 'market',
      schema: {
        market: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'clusterPipeline',
      property_name: 'clusterPipeline',
      schema: {
        clusterPipeline: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    },
    {
      query: 'filterByDemographics',
      property_name: 'filterByDemographics',
      schema: {
        filterByDemographics: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    },
    {
      query: 'targetMarket',
      property_name: 'targetMarket',
      schema: {
        targetMarket: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'scalingFactor',
      property_name: 'scalingFactor',
      schema: {
        scalingFactor: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'targetPipeline { id }',
      property_name: 'targetPipeline',
      schema: {
        pipeline: {
          type: 'object',
          required: %w'id',
          properties: {
            id: {
              '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
            }
          }
        }
      }
    },
    {
      query: 'targetPipelineId',
      property_name: 'targetPipelineId',
      schema: {
        targetPipelineId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'crossMarketPipeline',
      property_name: 'crossMarketPipeline',
      schema: {
        crossMarketPipeline: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    }
  ]

  @rand_market_pipeline_mapping = GraphqlHelpers.property_definition(@market_pipeline_mapping)


  @report_section_taxonomies = [
    {
      query: 'reportScoreCard { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'reportScoreCard',
      schema: {
        reportScoreCard: {
          type: 'array',
          items: {
            type: 'array',
            items: {
              oneOf: [
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                },
                {
                  type: 'null'
                }
              ]
            }
          }
        }
      }
    },
    {
      query: 'reportGrowth { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'reportGrowth',
      schema: {
        reportGrowth: {
          type: 'array',
          items: {
            type: 'array',
            items: {
              oneOf: [
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                },
                {
                  type: 'null'
                }
              ]
            }
          }
        }
      }
    },
    {
      query: 'reportTop3Associations { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'reportTop3Associations',
      schema: {
        reportTop3Associations: {
          type: 'array',
          items: {
            type: 'array',
            items: {
              oneOf: [
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                },
                {
                  type: 'null'
                }
              ]
            }
          }
        }
      }
    },
    {
      query: 'reportTop10Associations { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'reportTop10Associations',
      schema: {
        reportTop10Associations: {
          type: 'array',
          items: {
            type: 'array',
            items: {
              oneOf: [
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                },
                {
                  type: 'null'
                }
              ]
            }
          }
        }
      }
    },
    {
      query: 'uiScoreCard { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'uiScoreCard',
      schema: {
        uiScoreCard: {
          type: 'array',
          items: {
            type: 'array',
            items: {
              oneOf: [
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                },
                {
                  type: 'null'
                }
              ]
            }
          }
        }
      }
    },
    {
      query: 'uiHeroAssociationFilters { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'uiHeroAssociationFilters',
      schema: {
        uiHeroAssociationFilters: {
          type: 'array',
          items: {
            type: 'array',
            items: {
              oneOf: [
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                },
                {
                  type: 'null'
                }
              ]
            }
          }
        }
      }
    }
  ]

  @rand_report_section_taxonomies = GraphqlHelpers.property_definition(@report_section_taxonomies)

  @tpv_report = [
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
      query: 'clusterPipeline',
      property_name: 'clusterPipeline',
      schema: {
        clusterPipeline: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    },
    {
      query: 'filterByDemographics',
      property_name: 'filterByDemographics',
      schema: {
        filterByDemographics: {
          '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
        }
      }
    },
    {
      query: 'defaultTaxonomyProjectName',
      property_name: 'defaultTaxonomyProjectName',
      schema: {
        defaultTaxonomyProjectName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'slug',
      property_name: 'slug',
      schema: {
        slug: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'type',
      property_name: 'type',
      schema: {
        type: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!report_type.json"
        }
      }
    },
    {
      query: 'createdDate',
      property_name: 'createdDate',
      schema: {
        createdDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
        }
      }
    },
    {
      query: 'createdBy',
      property_name: 'createdBy',
      schema: {
        createdBy: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'lastModifiedDate',
      property_name: 'lastModifiedDate',
      schema: {
        lastModifiedDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
        }
      }
    },
    {
      query: 'lastModifiedBy',
      property_name: 'lastModifiedBy',
      schema: {
        lastModifiedBy: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'pipeline { id }',
      property_name: 'pipeline',
      schema: {
        pipeline: {
          oneOf: [
            {
              type: 'object',
              required: %w'id',
              properties: {
                id: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'myPermission',
      property_name: 'myPermission',
      schema: {
        myPermission: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!permission.json"
        }
      }
    },
    {
      query: 'userPermissions { ' + GraphqlHelpers.filtered_definitions(Common.entity_permission, :query).join(' ') + ' }',
      property_name: 'userPermissions',
      schema: {
        userPermissions: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(Common.entity_permission, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(Common.entity_permission, :schema).reduce(&:merge)
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
      query: 'groupPermissions { ' + GraphqlHelpers.filtered_definitions(Common.entity_permission, :query).join(' ') + ' }',
      property_name: 'groupPermissions',
      schema: {
        groupPermissions: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(Common.entity_permission, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(Common.entity_permission, :schema).reduce(&:merge)
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
      query: 'organisationPermissions { ' + GraphqlHelpers.filtered_definitions(Common.entity_permission, :query).join(' ') + ' }',
      property_name: 'organisationPermissions',
      schema: {
        organisationPermissions: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(Common.entity_permission, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(Common.entity_permission, :schema).reduce(&:merge)
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
      query: 'pipelineId',
      property_name: 'pipelineId',
      schema: {
        pipelineId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/id.json"
        }
      }
    },
    {
      query: 'iconUrl',
      property_name: 'iconUrl',
      schema: {
        iconUrl: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'scalingFactor',
      property_name: 'scalingFactor',
      schema: {
        scalingFactor: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'sectionTaxonomyPaths { ' + GraphqlHelpers.filtered_definitions(@report_section_taxonomies, :query).join(' ') + ' }',
      property_name: 'sectionTaxonomyPaths',
      schema: {
        sectionTaxonomyPaths: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@report_section_taxonomies, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(@report_section_taxonomies, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'marketPipelineMappings { ' + GraphqlHelpers.filtered_definitions(@market_pipeline_mapping, :query).join(' ') + ' }',
      property_name: 'marketPipelineMappings',
      schema: {
        marketPipelineMappings: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@market_pipeline_mapping, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(@market_pipeline_mapping, :schema).reduce(&:merge)
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
    },
    {
      query: 'marketTaxonomyMappings { ' + GraphqlHelpers.filtered_definitions(@market_taxonomy_mapping, :query).join(' ') + ' }',
      property_name: 'marketTaxonomyMappings',
      schema: {
        marketTaxonomyMappings: {
          oneOf: [
             {
               type: 'array',
               items: {
                 oneOf: [
                    {
                      type: 'object',
                      required: GraphqlHelpers.filtered_definitions(@market_taxonomy_mapping, :property_name),
                      properties:
                        GraphqlHelpers.filtered_definitions(@market_taxonomy_mapping, :schema).reduce(&:merge)
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
    },
    {
      query: 'associationMappings { ' + GraphqlHelpers.filtered_definitions(@report_association_mapping, :query).join(' ') + ' }',
      property_name: 'associationMappings',
      schema: {
        associationMappings: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@report_association_mapping, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(@report_association_mapping, :schema).reduce(&:merge)
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
    },
    {
      query: 'reportMetaData { ' + GraphqlHelpers.filtered_definitions(@report_meta_data, :query).join(' ') + ' }',
      property_name: 'reportMetaData',
      schema: {
        reportMetaData: {
          oneOf: [
             {
               type: 'object',
               required: GraphqlHelpers.filtered_definitions(@report_meta_data, :property_name),
               properties:
                 GraphqlHelpers.filtered_definitions(@report_meta_data, :schema).reduce(&:merge)
             },
             {
               type: 'null'
             }
           ]
        }
      }
    },
    {
      query: 'trendMetricsTaxonomies { ' + GraphqlHelpers.filtered_definitions(Common.tax_node, :query).join(' ') + ' }',
      property_name: 'trendMetricsTaxonomies',
      schema: {
        trendMetricsTaxonomies: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'array',
                items: {
                  oneOf: [
                    {
                      type: 'object',
                      required: GraphqlHelpers.filtered_definitions(Common.tax_node, :property_name),
                      properties:
                        GraphqlHelpers.filtered_definitions(Common.tax_node, :schema).reduce(&:merge)
                    },
                    {
                      type: 'null'
                    }
                  ]
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
      query: 'alternativeNames { ' + GraphqlHelpers.filtered_definitions(@language_name, :query).join(' ') + ' }',
      property_name: 'alternativeNames',
      schema: {
        alternativeNames: {
          oneOf: [
             {
               type: 'array',
               items: {
                 oneOf: [
                    {
                      type: 'object',
                      required: GraphqlHelpers.filtered_definitions(@language_name, :property_name),
                      properties:
                        GraphqlHelpers.filtered_definitions(@language_name, :schema).reduce(&:merge)
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

  @rand_tpv_report = GraphqlHelpers.property_definition(@tpv_report)
end
