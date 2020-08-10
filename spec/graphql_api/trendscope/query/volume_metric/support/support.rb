require './spec/graphql_api/trendscope/definitions/volume_metric_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module VolumeMetricSupport

  def self.pipelines_runs_volume_metric (definition)
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
                                  required: %w'volume',
                                  properties: {
                                    volume: {
                                      type: 'object',
                                      required: %w'metric',
                                      properties: {
                                        metric: {
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

  def self.pipelines_runs_volume_metric_full
    pipelines_runs_volume_metric(VolumeMetricDefinitions.volume_metric)
  end

  def self.pipelines_runs_volume_metric_rand
    pipelines_runs_volume_metric(VolumeMetricDefinitions.rand_volume_metric)
  end

  def self.pipelines_last_run_volume_metric (definition)
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
                            required: %w'volume',
                            properties: {
                              volume: {
                                type: 'object',
                                required: %w'metric',
                                properties: {
                                  metric: {
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

  def self.pipelines_last_run_volume_metric_full
    pipelines_last_run_volume_metric(VolumeMetricDefinitions.volume_metric)
  end

  def self.pipelines_last_run_volume_metric_rand
    pipelines_last_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)
  end

  def self.pipelines_run_volume_metric (definition)
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
                            required: %w'volume',
                            properties: {
                              volume: {
                                type: 'object',
                                required: %w'metric',
                                properties: {
                                  metric: {
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

  def self.pipelines_run_volume_metric_full
    pipelines_run_volume_metric(VolumeMetricDefinitions.volume_metric)
  end

  def self.pipelines_run_volume_metric_rand
    pipelines_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)
  end

  def self.pipeline_runs_volume_metric (definition)
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
                            required: %w'volume',
                            properties: {
                              volume: {
                                type: 'object',
                                required: %w'metric',
                                properties: {
                                  metric: {
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

  def self.pipeline_runs_volume_metric_full
    pipeline_runs_volume_metric(VolumeMetricDefinitions.volume_metric)
  end

  def self.pipeline_runs_volume_metric_rand
    pipeline_runs_volume_metric(VolumeMetricDefinitions.rand_volume_metric)
  end

  def self.pipeline_last_run_volume_metric (definition)
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
                      required: %w'volume',
                      properties: {
                        volume: {
                          type: 'object',
                          required: %w'metric',
                          properties: {
                            metric: {
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

  def self.pipeline_last_run_volume_metric_full
    pipeline_last_run_volume_metric(VolumeMetricDefinitions.volume_metric)
  end

  def self.pipeline_last_run_volume_metric_rand
    pipeline_last_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)
  end

  def self.pipeline_run_volume_metric (definition)
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
                      required: %w'volume',
                      properties: {
                        volume: {
                          type: 'object',
                          required: %w'metric',
                          properties: {
                            metric: {
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

  def self.pipeline_run_volume_metric_full
    pipeline_run_volume_metric(VolumeMetricDefinitions.volume_metric)
  end

  def self.pipeline_run_volume_metric_rand
    pipeline_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)
  end
end


