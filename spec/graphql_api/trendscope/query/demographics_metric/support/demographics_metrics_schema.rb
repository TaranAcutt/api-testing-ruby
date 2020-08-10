require './spec/graphql_api/trendscope/definitions/demographics_metric_definitions'

module DemographicMetricSupport
  
  def self.pipelines_runs_demographics_metrics (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelines'],
          properties: {
            pipelines: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: ['runs'],
                    properties: {
                      runs: {
                        oneOf: [
                          {
                            type: 'object',
                            required: ['nodes'],
                            properties: {
                              nodes: {
                                type: 'array',
                                items: {
                                  type: 'object',
                                  required: %w[demographic],
                                  properties: {
                                    demographic: {
                                      type: 'object',
                                      required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                      properties:
                                        GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
                }
              }
            }
          }
        }
      }
    }
  end

  def self.pipelines_runs_demographics_metrics_full
    pipelines_runs_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)
  end

  def self.pipelines_runs_demographics_metrics_rand
    pipelines_runs_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)
  end
  
  def self.pipelines_last_run_demographics_metrics (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelines'],
          properties: {
            pipelines: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: ['lastRun'],
                    properties: {
                      lastRun: {
                        oneOf: [
                          {
                            type: 'object',
                            required: %w[demographic],
                            properties: {
                              demographic: {
                                type: 'object',
                                required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                properties:
                                  GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
              }
            }
          }
        }
      }
    }
  end

  def self.pipelines_last_run_demographics_metrics_full
    pipelines_last_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)
  end

  def self.pipelines_last_run_demographics_metrics_rand
    pipelines_last_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)
  end
  
  def self.pipelines_run_demographics_metrics (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelines'],
          properties: {
            pipelines: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: ['run'],
                    properties: {
                      run: {
                        oneOf: [
                          {
                            type: 'object',
                            required: %w[demographic],
                            properties: {
                              demographic: {
                                oneOf: [
                                  {
                                    type: 'object',
                                    required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                    properties:
                                      GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def self.pipelines_run_demographics_metrics_full
    pipelines_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)
  end

  def self.pipelines_run_demographics_metrics_rand
    pipelines_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)
  end
  
  def self.pipeline_runs_demographics_metrics (definition)
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
              required: ['runs'],
              properties: {
                runs: {
                  oneOf: [
                    {
                      type: 'object',
                      required: ['nodes'],
                      properties: {
                        nodes: {
                          type: 'array',
                          items: {
                            type: 'object',
                            required: ['demographic'],
                            properties: {
                              demographic: {
                                type: 'object',
                                required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                properties:
                                  GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
          }
        }
      }
    }
  end

  def self.pipeline_runs_demographics_metrics_full
    pipeline_runs_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)
  end

  def self.pipeline_runs_demographics_metrics_rand
    pipeline_runs_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)
  end
  
  def self.pipeline_last_run_demographics_metrics (definition)
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
              required: ['lastRun'],
              properties: {
                lastRun: {
                  oneOf: [
                    {
                      type: 'object',
                      required: %w[demographic],
                      properties: {
                        demographic: {
                          type: 'object',
                          required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                          properties:
                            GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
        }
      }
    }
  end

  def self.pipeline_last_run_demographics_metrics_full
    pipeline_last_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)
  end

  def self.pipeline_last_run_demographics_metrics_rand
    pipeline_last_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)
  end
  
  def self.pipeline_run_demographics_metrics (definition)
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
              required: ['run'],
              properties: {
                run: {
                  oneOf: [
                    {
                      type: 'object',
                      required: %w[demographic],
                      properties: {
                        demographic: {
                          type: 'object',
                          required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                          properties:
                            GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
        }
      }
    }
  end

  def self.pipeline_run_demographics_metrics_full
    pipeline_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)
  end

  def self.pipeline_run_demographics_metrics_rand
    pipeline_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)
  end
end
