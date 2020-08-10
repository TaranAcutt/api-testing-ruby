require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'

module PipelineRunSupport
  module_function
  
  def pipelines_last_run_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['pipelines'],
          'properties': {
            'pipelines': {
              'type': 'object',
              'required': ['nodes'],
              'properties': {
                'nodes': {
                  'type': 'array',
                  'items': {
                    'type': 'object',
                    'required': ['lastRun'],
                    'properties': {
                      'lastRun': {
                        'oneOf': [
                          {
                            'type': 'object',
                            'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                            'properties':
                              GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                          },
                          {
                            'type': 'null'
                          }
                        ]
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def pipelines_last_run_schema_full
    pipelines_last_run_schema(PipelineRunDefinitions.pipeline_run)
  end

  def pipelines_last_run_schema_rand
    pipelines_last_run_schema(PipelineRunDefinitions.rand_pipeline_run)
  end

  def pipeline_last_run_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['pipeline'],
          'properties': {
            'pipeline': {
              'type': 'object',
              'required': ['lastRun'],
              'properties': {
                'lastRun': {
                  'oneOf': [
                    {
                      'type': 'object',
                      'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                      'properties':
                        GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                    },
                    {
                      'type': 'null'
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

  def pipeline_last_run_schema_full
    pipeline_last_run_schema(PipelineRunDefinitions.pipeline_run)
  end

  def pipeline_last_run_schema_rand
    pipeline_last_run_schema(PipelineRunDefinitions.rand_pipeline_run)
  end

  def pipelines_run_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['pipelines'],
          'properties': {
            'pipelines': {
              'type': 'object',
              'required': ['nodes'],
              'properties': {
                'nodes': {
                  'type': 'array',
                  'items': {
                    'type': 'object',
                    'required': ['run'],
                    'properties': {
                      'run': {
                        'oneOf': [
                          {
                            'type': 'object',
                            'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                            'properties':
                              GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                          },
                          {
                            'type': 'null'
                          }
                        ]
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def pipelines_run_schema_full
    pipelines_run_schema(PipelineRunDefinitions.pipeline_run)
  end

  def pipelines_run_schema_rand
    pipelines_run_schema(PipelineRunDefinitions.rand_pipeline_run)
  end

  def pipelines_runs_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['pipelines'],
          'properties': {
            'pipelines': {
              'type': 'object',
              'required': ['nodes'],
              'properties': {
                'nodes': {
                  'type': 'array',
                  'items': {
                    'type': 'object',
                    'required': ['runs'],
                    'properties': {
                      'runs': {
                        'type': 'object',
                        'required': ['nodes'],
                        'properties': {
                          'nodes': {
                            'type': 'array',
                            'items': {
                              'type': 'object',
                              'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                              'properties':
                                GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def pipelines_runs_schema_full
    pipelines_runs_schema(PipelineRunDefinitions.pipeline_run)
  end

  def pipelines_runs_schema_rand
    pipelines_runs_schema(PipelineRunDefinitions.rand_pipeline_run)
  end

  def pipeline_runs_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['pipeline'],
          'properties': {
            'pipeline': {
              'type': 'object',
              'required': ['runs'],
              'properties': {
                'runs': {
                  'type': 'object',
                  'required': ['nodes'],
                  'properties': {
                    'nodes': {
                      'type': 'array',
                      'items': {
                        'type': 'object',
                        'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                        'properties':
                          GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def pipeline_runs_schema_full
    pipeline_runs_schema(PipelineRunDefinitions.pipeline_run)
  end

  def pipeline_runs_schema_rand
    pipeline_runs_schema(PipelineRunDefinitions.rand_pipeline_run)
  end

  def pipeline_run_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['pipeline'],
          'properties': {
            'pipeline': {
              'type': 'object',
              'required': ['run'],
              'properties': {
                'run': {
                  'oneOf': [
                    {
                      'type': 'object',
                      'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                      'properties':
                        GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                    },
                    {
                      'type': 'null'
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

  def pipeline_run_schema_full
    pipeline_run_schema(PipelineRunDefinitions.pipeline_run)
  end

  def pipeline_run_schema_rand
    pipeline_run_schema(PipelineRunDefinitions.rand_pipeline_run)
  end
end
