require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/common_definitions'

module StepDefinitions
  class << self
    attr_accessor :step, :rand_step
  end

  @step = [
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
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!pipeline_step_status_type.json"
        }
      }
    },
    {
      query: 'createdDate',
      property_name: 'createdDate',
      schema: {
        'createdDate': {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
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
      query: 'createdBy',
      property_name: 'createdBy',
      schema: {
        createdBy: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
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
      query: 'lastModifiedDate',
      property_name: 'lastModifiedDate',
      schema: {
        lastModifiedDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
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
      query: 'inputs { name ...on InputUri { name config uri { ...on FileUri { type path format } ...on ApiUri { format method type url } ...on S3FileUri { type bucket path format } ...on DatabaseUri { type host port database collection } ...on TableUri { type database tableName } ...on ElasticsearchUri { idField index node port retries ssl type writeOperation } } } ...on InputStep { name stepId outputName config} }',
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
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
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
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
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
                            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                          }
                        }
                      }
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
      query: 'outputs { name ...on OutputUri { name uri { ...on FileUri { type path format } ...on ApiUri { format method type url } ...on S3FileUri { type bucket path format } ...on DatabaseUri { type host port database collection } ...on TableUri { type database tableName } ...on ElasticsearchUri { idField index node port retries ssl type writeOperation } } } }',
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
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
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
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/data_uri_output_type.json"
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
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
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

  @rand_step = GraphqlHelpers.property_definition(@step)
end