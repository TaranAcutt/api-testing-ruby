require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/common_definitions'
require './spec/graphql_api/trendscope//definitions/pipeline_definitions'

module PipelineTemplatesDefinitions
  class << self
    attr_accessor :pipeline_templates, :rand_pipeline_templates, :step_template, :rand_step_template, :pipeline_template_defaults, :rand_pipeline_template_defaults
  end
  
  @step_template = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/id.json"
        }
      }
    },
    {
      query: 'label',
      property_name: 'label',
      schema: {
        label: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'type',
      property_name: 'type',
      schema: {
        type: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'order',
      property_name: 'order',
      schema: {
        order: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_step_status_type.json"
        }
      }
    },
    {
      query: 'inputs { name ...on InputUri { name config uri { ...on FileUri { type path format } ...on ApiUri { format method type url } ...on S3FileUri { type bucket path format } ...on ElasticsearchUri { idField index node port retries ssl type writeOperation } ...on DatabaseUri { type host port database collection } ...on TableUri { type database tableName } } } ...on InputStep { name stepId outputName config} }',
      property_name: 'inputs',
      schema: {
        inputs: {
          type: 'array',
          items: {
            anyOf: [
              {
                type: 'object',
                required: %w'name uri config',
                properties: {
                  name: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                  },
                  config: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                  },
                  uri: {
                    anyOf: [
                      {
                        type: 'object',
                        required: %w'path type format',
                        properties: {
                          path: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          type: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                          },
                          format: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                          }
                        }
                      },
                      {
                        type: 'object',
                        required: %w'idField index node port retries ssl type writeOperation',
                        properties: {
                          idField: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                          },
                          index: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          node: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          port: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
                          },
                          retries: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
                          },
                          ssl: {
                            '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
                          },
                          type: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                          },
                          writeOperation: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                          }
                        }
                      },
                      {
                        type: 'object',
                        required: %w'format method type url',
                        properties: {
                          format: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                          },
                          method: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          type: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                          },
                          url: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          }
                        }
                      },
                      {
                        type: 'object',
                        required: %w'path bucket type format',
                        properties: {
                          path: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          bucket: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          type: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                          },
                          format: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                          }
                        }
                      },
                      {
                        type: 'object',
                        required: %w'database host port type collection',
                        properties: {
                          host: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          port: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
                          },
                          database: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          collection: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          type: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                          }
                        }
                      },
                      {
                        type: 'object',
                        required: %w'database type tableName',
                        properties: {
                          database: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          tableName: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          },
                          type: {
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                          }
                        }
                      },
                    ]
                  }
                }
              },
              {
                type: 'object',
                required: %w'name stepId outputName config',
                properties: {
                  name: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                  },
                  stepId: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                  },
                  outputName: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                  },
                  config: {
                    '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                  }
                }
              }
            ]
          }
        }
      }
    },
    {
      query: 'outputs { name ...on OutputUri { name uri { ...on FileUri { type path format } ...on ApiUri { format method type url } ...on S3FileUri { type bucket path format } ...on ElasticsearchUri { idField index node port retries ssl type writeOperation } ...on DatabaseUri { type host port database collection } ...on TableUri { type database tableName }  } } }',
      property_name: 'outputs',
      schema: {
        outputs: {
          type: 'array',
          items: {
            type: 'object',
            required: %w'name uri',
            properties: {
              name: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
              },
              uri: {
                anyOf: [
                  {
                    type: 'object',
                    required: %w'path type format',
                    properties: {
                      path: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                      },
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'format method type url',
                    properties: {
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      },
                      method: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                      },
                      url: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'idField index node port retries ssl type writeOperation',
                    properties: {
                      idField: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      },
                      index: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      node: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      port: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
                      },
                      retries: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
                      },
                      ssl: {
                        '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                      },
                      writeOperation: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'path bucket type format',
                    properties: {
                      path: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      bucket: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                      },
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'database host port type collection',
                    properties: {
                      host: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      port: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
                      },
                      database: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      collection: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'database type tableName',
                    properties: {
                      database: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      tableName: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!data_uri_output_type.json"
                      }
                    }
                  }
                ]
              }
            }
          }
        }
      }
    },
    {
      query: 'applicationClass',
      property_name: 'applicationClass',
      schema: {
        applicationClass: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'repositories',
      property_name: 'repositories',
      schema: {
        repositories: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'packages',
      property_name: 'packages',
      schema: {
        packages: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
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
      query: 'config',
      property_name: 'config',
      schema: {
        config: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'application { ... on FileUri { path type format } ... on S3FileUri { path bucket type format }}',
      property_name: 'application',
      schema: {
        application: {
          anyOf: [
            {
              type: 'object',
              required: %w'path type format',
              properties: {
                path: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                type: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                },
                format: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                }
              }
            },
            {
              type: 'object',
              required: %w'path bucket type format',
              properties: {
                path: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                bucket: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                type: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                },
                format: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'jars { ... on FileUri { path type format } ... on S3FileUri { path bucket type format }}',
      property_name: 'jars',
      schema: {
        jars: {
          oneOf: [
            {
              type: 'array',
              items: {
                anyOf: [
                  {
                    type: 'object',
                    required: %w'path type format',
                    properties: {
                      path: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                      },
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'path bucket type format',
                    properties: {
                      path: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      bucket: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                      },
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
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
      query: 'bootstrapScripts { ... on FileUri { path type format } ... on S3FileUri { path bucket type format }}',
      property_name: 'bootstrapScripts',
      schema: {
        bootstrapScripts: {
          oneOf: [
            {
              type: 'array',
              items: {
                anyOf: [
                  {
                    type: 'object',
                    required: %w'path type format',
                    properties: {
                      path: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                      },
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
                  },
                  {
                    type: 'object',
                    required: %w'path bucket type format',
                    properties: {
                      path: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      bucket: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      type: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                      },
                      format: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                      }
                    }
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
      query: 'pyPiLibraries { ' + GraphqlHelpers.filtered_definitions(Common.py_pi_libraries, :query).join(' ') + ' }',
      property_name: 'pyPiLibraries',
      schema: {
        pyPiLibraries: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(Common.py_pi_libraries, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(Common.py_pi_libraries, :schema).reduce(&:merge)
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
      query: 'pyFiles { ... on FileUri { path type format } ... on S3FileUri { path bucket type format } }',
      property_name: 'pyFiles',
      schema: {
        pyFiles: {
          anyOf: [
            {
              type: 'object',
              required: %w'path type format',
              properties: {
                path: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                type: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                },
                format: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                }
              }
            },
            {
              type: 'object',
              required: %w'path bucket type format',
              properties: {
                path: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                bucket: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                },
                type: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
                },
                format: {
                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
  
  @rand_step_template = GraphqlHelpers.property_definition(@step_template)

  @pipeline_template_defaults = [
    {
      query: 'endDate',
      property_name: 'endDate',
      schema: {
        endDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
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
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'startDate',
      property_name: 'startDate',
      schema: {
        startDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
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

  @rand_pipeline_template_defaults = GraphqlHelpers.property_definition(@pipeline_template_defaults)
  
  @pipeline_templates = [
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
      query: 'group',
      property_name: 'group',
      schema: {
        group: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'tags',
      property_name: 'tags',
      schema: {
        tags: {
          anyOf: [
            {
              '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'environment',
      property_name: 'environment',
      schema: {
        environment: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/environment.json"
        }
      }
    },
    {
      query: 'description',
      property_name: 'description',
      schema: {
        description: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'template { ' + GraphqlHelpers.filtered_definitions(pipeline_template_defaults, :query).join(' ') + ' }',
      property_name: 'template',
      schema: {
        template: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(pipeline_template_defaults, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(pipeline_template_defaults, :schema).reduce(&:merge)
        }
      }
    },
    {
      query: 'steps { ' + GraphqlHelpers.filtered_definitions(step_template, :query).join(' ') + ' }',
      property_name: 'steps',
      schema: {
        steps: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(step_template, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(step_template, :schema).reduce(&:merge)
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
    }
  ]
  
  @rand_pipeline_templates = GraphqlHelpers.property_definition(@pipeline_templates)

end