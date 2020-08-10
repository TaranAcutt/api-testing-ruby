require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/pipeline_templates_definitions'

module StepDefinitionsDefinitions
  class << self
    attr_accessor :step_definitions, :rand_step_definitions, :field_permissions, :rand_field_permissions
  end

  @field_permissions = [
    {
      query: 'field',
      property_name: 'field',
      schema: {
        field: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'permission',
      property_name: 'permission',
      schema: {
        schema: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!permission.json"
        }
      }
    }
  ]

  @rand_field_permissions = GraphqlHelpers.property_definition(@field_permissions)
  
  @step_definitions = [
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
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'inputs { namedInputs { name validInputs { ...on ValidStepInput { type stepType outputName } ...on ValidURIInput { type } } required } dynamicInput { validInputs { ...on ValidStepInput { type stepType outputName } ...on ValidURIInput { type } } min max } }',
      property_name: 'inputs',
      schema: {
        inputs: {
          type: 'object',
          required: %w'namedInputs dynamicInput',
          properties: {
            namedInputs: {
              oneOf: [
                {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: %w'name validInputs required',
                    properties: {
                      name: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                      },
                      validInputs: {
                        type: 'array',
                        items: {
                          anyOf: [
                            {
                              type: 'object',
                              required: %w'type',
                              properties: {
                                type: {
                                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!valid_input_type.json"
                                }
                              }
                            },
                            {
                              type: 'object',
                              required: %w'stepType type outputName',
                              properties: {
                                outputName: {
                                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                                },
                                stepType: {
                                  '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                                },
                                type: {
                                  '$ref': "#{SchemaHelpers.schemas}/trendscope/!valid_input_type.json"
                                }
                              }
                            },
                          ]
                        }
                      },
                      required: {
                        '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
                      }
                    }
                  }
                },
                {
                  type: 'null'
                }
              ]
            },
            dynamicInput: {
              oneOf: [
                {
                  type: 'object',
                  required: %w'validInputs min max',
                  properties: {
                    validInputs: {
                      type: 'array',
                      items: {
                        anyOf: [
                          {
                            type: 'object',
                            required: %w'type',
                            properties: {
                              type: {
                                '$ref': "#{SchemaHelpers.schemas}/trendscope/!valid_input_type.json"
                              }
                            }
                          },
                          {
                            type: 'object',
                            required: %w'stepType type outputName',
                            properties: {
                              outputName: {
                                '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                              },
                              stepType: {
                                '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
                              },
                              type: {
                                '$ref': "#{SchemaHelpers.schemas}/trendscope/!valid_input_type.json"
                              }
                            }
                          },
                        ]
                      }
                    },
                    min: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
                    },
                    max: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
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
      }
    },
    {
      query: 'outputs { namedOutputs { name required } dynamicOutput { min max } }',
      property_name: 'outputs',
      schema: {
        'outputs': {
          namedOutputs: {
            oneOf: [
              {
                type: 'array',
                items: {
                  type: 'object',
                  required: %w'name required',
                  properties: {
                    name: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                    },
                    required: {
                      '$ref': "#{SchemaHelpers.schemas}/support/boolean.json"
                    }
                  }
                }
              },
              {
                type: 'null'
              }
            ]
          },
          dynamicOutputs: {
            type: 'object',
            required: %w'min max',
            properties: {
              min: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
              },
              max: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
              }
            }
          }
        }
      }
    },
    {
      query: 'template { ' + GraphqlHelpers.filtered_definitions(PipelineTemplatesDefinitions.step_template, :query).join(' ') + ' }',
      property_name: 'template',
      schema: {
        template: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(PipelineTemplatesDefinitions.step_template, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(PipelineTemplatesDefinitions.step_template, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'fieldPermissions { ' + GraphqlHelpers.filtered_definitions(@field_permissions, :query).join(' ') + ' }',
      property_name: 'fieldPermissions',
      schema: {
        fieldPermissions: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@field_permissions, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@field_permissions, :schema).reduce(&:merge)
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
  
  @rand_step_definitions = GraphqlHelpers.property_definition(@step_definitions)
  
end