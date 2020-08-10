require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/step_definitions'

module MutationPipelineSchema

  def self.create_pipeline_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['createPipeline'],
          properties: {
            createPipeline: {
              type: 'object',
              required: %w'id name',
              properties: {
                id: {
                  type: 'string'
                },
                name: {
                  type: 'string'
                },
                status: {
                  type: 'string',
                  enum: ['NEW']
                }
              }
            }
          }
        }
      }
    }
  end

  def self.create_pipeline_full_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['createPipeline'],
          properties: {
            createPipeline: {
              type: 'object',
              required: %w'id name status markets startDate endDate steps myPermission userPermissions groupPermissions organisationPermissions createdBy createdDate lastModifiedBy lastModifiedDate',
              properties: {
                id: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
                },
                name: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                status: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_status.json"
                },
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
                },
                startDate: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
                },
                endDate: {
                  anyOf: [
                    {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
                    },
                    {
                      type: 'null'
                    }
                  ]
                },
                createdDate: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
                },
                myPermission: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!permission.json"
                },
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
                },
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
                },
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
                },
                lastModifiedDate: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
                },

                createdBy: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                lastModifiedBy: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
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
            }
          }
        }
      }
    }

  end

  def self.update_pipeline_full_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['updatePipeline'],
          properties: {
            updatePipeline: {
              type: 'object',
              required: %w'id name status dataWindow runInterval markets startDate endDate steps myPermission userPermissions groupPermissions organisationPermissions createdBy createdDate lastModifiedBy lastModifiedDate',
              properties: {
                id: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
                },
                name: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                status: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_status.json"
                },
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
                },
                runInterval: {
                  oneOf: [
                    {
                      type: 'object',
                      required: GraphqlHelpers.filtered_definitions(PipelineDefinitions.time_period, :property_name),
                      properties:
                        GraphqlHelpers.filtered_definitions(PipelineDefinitions.time_period, :schema).reduce(&:merge)
                    },
                    {
                      type: 'null'
                    }
                  ]
                },
                dataWindow: {
                  oneOf: [
                    {
                      type: 'object',
                      required: GraphqlHelpers.filtered_definitions(PipelineDefinitions.time_period, :property_name),
                      properties:
                        GraphqlHelpers.filtered_definitions(PipelineDefinitions.time_period, :schema).reduce(&:merge)
                    },
                    {
                      type: 'null'
                    }
                  ]
                },
                startDate: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
                },
                endDate: {
                  anyOf: [
                    {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
                    },
                    {
                      type: 'null'
                    }
                  ]
                },
                createdDate: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
                },
                myPermission: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!permission.json"
                },
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
                },
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
                },
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
                },
                lastModifiedDate: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!date.json"
                },

                createdBy: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                lastModifiedBy: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
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
            }
          }
        }
      }
    }
  end

  def self.delete_pipeline_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['deletePipeline'],
          properties: {
            createPipeline: {
              type: 'object',
              required: %w'id name status',
              properties: {
                id: {
                  type: 'string'
                },
                name: {
                  type: 'string'
                },
                status: {
                  type: 'string',
                  enum: ['NEW']
                }
              }
            }
          }
        }
      }
    }
  end

  def self.get_pipeline_schema
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
              required: %w'id name',
              properties: {
                id: {
                  type: 'string'
                },
                name: {
                  type: 'string'
                },
                status: {
                  type: 'string',
                  enum: ['NEW']
                }
              }
            }
          }
        }
      }
    }
  end

  def self.deleted_pipeline_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipeline'],
          properties: {
            pipeline: {
              type: 'null'
            }
          }
        }
      }
    }
  end
end
