require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/common_definitions'
require './spec/graphql_api/trendscope/definitions/step_definitions'

module PipelineDefinitions
  class << self
    attr_accessor :pipeline, :rand_pipeline, :market, :rand_market, :time_period, :rand_time_period, :pipeline_revision_value, :rand_pipeline_revision_value,
                  :pipeline_revision, :rand_pipeline_revision, :pipeline_revision_log, :rand_pipeline_revision_log
  end
  
  @market = [
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
      query: 'query',
      property_name: 'query',
      schema: {
        query: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'timezone',
      property_name: 'timezone',
      schema: {
        timezone: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
  ]
  
  @rand_market = GraphqlHelpers.property_definition(@market)
  
  @time_period = [
    {
      query: 'unit',
      property_name: 'unit',
      schema: {
        unit: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/time_unit.json"
        }
      }
    },
    {
      query: 'value',
      property_name: 'value',
      schema: {
        value: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    }
  ]
  
  
  @rand_time_period = GraphqlHelpers.property_definition(@time_period)
  
  @pipeline_revision = [
    {
      query: 'pipeline',
      property_name: 'pipeline',
      schema: {
        pipeline: {
          type: 'null'
        }
      }
    },
    {
      query: 'steps',
      property_name: 'steps',
      schema: {
        steps: {
          type: 'null'
        }
      }
    }
  ]
  
  @rand_pipeline_revision = GraphqlHelpers.property_definition(@pipeline_revision)
  
  @pipeline_revision_log = [
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
      query: 'createdDate',
      property_name: 'createdDate',
      schema: {
        createdDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
        }
      }
    },
    {
      query: 'revisionNumber',
      property_name: 'revisionNumber',
      schema: {
        revisionNumber: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'revisionSummary',
      property_name: 'revisionSummary',
      schema: {
        revisionSummary: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    }
  ]
  
  
  @rand_pipeline_revision_log = GraphqlHelpers.property_definition(@pipeline_revision_log)
  
  @pipeline_revision_value = [
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
      query: 'cleanedDate',
      property_name: 'cleanedDate',
      schema: {
        cleanedDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
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
      query: 'tags',
      property_name: 'tags',
      schema: {
        tags: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'currentOutputId',
      property_name: 'currentOutputId',
      schema: {
        currentOutputId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'endDate',
      property_name: 'endDate',
      schema: {
        endDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
        }
      }
    },
    {
      query: 'environment',
      property_name: 'environment',
      schema: {
        environment: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/environment.json"
        }
      }
    },
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
      query: 'lastModifiedBy',
      property_name: 'lastModifiedBy',
      schema: {
        lastModifiedBy: {
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
      query: 'markets { ' + GraphqlHelpers.filtered_definitions(market, :query).join(' ') + ' }',
      property_name: 'markets',
      schema: {
        markets: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(market, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(market, :schema).reduce(&:merge)
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
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'revisionNumber',
      property_name: 'revisionNumber',
      schema: {
        revisionNumber: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'revisionSummary',
      property_name: 'revisionSummary',
      schema: {
        revisionSummary: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'startDate',
      property_name: 'startDate',
      schema: {
        startDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_status.json"
        }
      }
    }
  ]
  
  
  @rand_pipeline_revision_value = GraphqlHelpers.property_definition(@pipeline_revision_value)
  
  @pipeline = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {query: 'name',
     property_name: 'name',
     schema: {
       name: {
         '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
       }
     }
    },
    {
      query: 'exclusionKeywordFiles',
      property_name: 'exclusionKeywordFiles',
      schema: {
        exclusionKeywordFiles: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
          }
        }
      }
    },
    {
      query: 'exclusionKeywordList',
      property_name: 'exclusionKeywordList',
      schema: {
        exclusionKeywordList: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
          }
        }
      }
    },
    {
      query: 'inclusionKeywordFiles',
      property_name: 'inclusionKeywordFiles',
      schema: {
        inclusionKeywordFiles: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
          }
        }
      }
    },
    {
      query: 'inclusionKeywordList',
      property_name: 'inclusionKeywordList',
      schema: {
        inclusionKeywordList: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
          }
        }
      }
    },
    {
      query: 'tags',
      property_name: 'tags',
      schema: {
        tags: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'environment',
      property_name: 'environment',
      schema: {
        environment: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/environment.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!pipeline_status.json"
        }
      }
    },
    {
      query: 'steps { ' + GraphqlHelpers.filtered_definitions(StepDefinitions.step, :query).join(' ') + ' }',
      property_name: 'steps',
      schema: {
        steps: {
          oneOf: [
            {
              type: 'array',
              items:
                {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(StepDefinitions.step, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(StepDefinitions.step, :schema).reduce(&:merge)
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
      query: 'startDate',
      property_name: 'startDate',
      schema: {
        startDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
        }
      }
    },
    {
      query: 'endDate',
      property_name: 'endDate',
      schema: {
        endDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
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
      query: 'cleanedDate',
      property_name: 'cleanedDate',
      schema: {
        cleanedDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
        }
      }
    },
    {
      query: 'revisionNumber',
      property_name: 'revisionNumber',
      schema: {
        revisionNumber: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'revisionSummary',
      property_name: 'revisionSummary',
      schema: {
        revisionSummary: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'currentOutputId',
      property_name: 'currentOutputId',
      schema: {
        currentOutputId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
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
      query: 'revision (number: 0){ pipeline { ' + GraphqlHelpers.filtered_definitions(pipeline_revision_value, :query).join(' ') + ' } steps { ' + GraphqlHelpers.filtered_definitions(StepDefinitions.step, :query).join(' ') + ' } }',
      property_name: 'revision',
      schema: {
        revision: {
          oneOf: [
            {
              type: 'object',
              required: %w'pipeline steps',
              properties: {
                steps: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(StepDefinitions.step, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(StepDefinitions.step, :schema).reduce(&:merge)
                  }
                },
                pipeline: {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(pipeline_revision_value, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(pipeline_revision_value, :schema).reduce(&:merge)
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
      query: 'revisions { nodes { ' + GraphqlHelpers.filtered_definitions(pipeline_revision_log, :query).join(' ') + ' } }',
      property_name: 'revisions',
      schema: {
        revisions: {
          oneOf: [
            {
              type: 'object',
              required: %w'nodes',
              properties: {
                steps: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(pipeline_revision_log, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(pipeline_revision_log, :schema).reduce(&:merge)
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
      query: 'lastModifiedDate',
      property_name: 'lastModifiedDate',
      schema: {
        lastModifiedDate: {
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
      query: 'lastModifiedBy',
      property_name: 'lastModifiedBy',
      schema: {
        lastModifiedBy: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'markets { ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.market, :query).join(' ') + ' }',
      property_name: 'markets',
      schema: {
        markets: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(PipelineDefinitions.market, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(PipelineDefinitions.market, :schema).reduce(&:merge)
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
      query: 'lastRun { id }',
      property_name: 'lastRun',
      schema: {
        lastRun: {
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
      query: 'run(id: "' + GraphqlDataService.pipeline_run_id + '") { id }',
      property_name: 'run',
      schema: {
        run: {
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
      query: 'runs { nodes { id } }',
      property_name: 'runs',
      schema: {
        runs: {
          oneOf: [
            {
              type: 'object',
              required: %w'nodes',
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: %w'id',
                    additionalProperties: false,
                    properties: {
                      id: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
                      }
                    }
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
      query: 'reports { tpvReports { nodes { id } } }',
      property_name: 'reports',
      schema: {
        reports: {
          oneOf: [
            {
              type: 'object',
              required: %w'tpvReports',
              properties: {
                tpvReports: {
                  type: 'object',
                  required: ['nodes'],
                  properties: {
                    nodes: {
                      type: 'array',
                      items: {
                        type: 'object',
                        required: %w'id',
                        additionalProperties: false,
                        properties: {
                          id: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
                          }
                        }
                      }
                    }
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
    }
  ]
  
  @rand_pipeline = GraphqlHelpers.property_definition(@pipeline)
end
