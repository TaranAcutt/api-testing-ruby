require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssocMetricsSchema
  
  def self.pipelines_runs_assoc_metrics (definition)
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
                        type: 'object',
                        required: ['nodes'],
                        properties: {
                          nodes: {
                            type: 'array',
                            items: {
                              type: 'object',
                              required: %w'association',
                              properties: {
                                association: {
                                  type: 'object',
                                  required: %w'metrics',
                                  properties: {
                                    metrics: {
                                      oneOf: [
                                        {
                                          type: 'object',
                                          required: %w'nodes',
                                          properties: {
                                            nodes: {
                                              type: 'array',
                                              items: {
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
                }
              }
            }
          }
        }
      }
    }
  end
  
  def self.pipelines_runs_assoc_metrics_schema_full
    pipelines_runs_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipelines_runs_assoc_metrics_schema_rand
    pipelines_runs_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipelines_last_run_assoc_metrics (definition)
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
                            required: %w'association',
                            properties: {
                              association: {
                                type: 'object',
                                required: %w'metrics',
                                properties: {
                                  metrics: {
                                    oneOf: [
                                      {
                                        type: 'object',
                                        required: %w'nodes',
                                        properties: {
                                          nodes: {
                                            type: 'array',
                                            items: {
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
  
  def self.pipelines_last_run_assoc_metrics_schema_full
    pipelines_last_run_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipelines_last_run_assoc_metrics_schema_rand
    pipelines_last_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipelines_run_assoc_metrics (definition)
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
                            required: %w'association',
                            properties: {
                              association: {
                                type: 'object',
                                required: %w'metrics',
                                properties: {
                                  metrics: {
                                    type: 'object',
                                    required: %w'nodes',
                                    properties: {
                                      nodes: {
                                        type: 'array',
                                        items: {
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
  
  def self.pipelines_run_assoc_metrics_schema_full
    pipelines_run_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipelines_run_assoc_metrics_schema_rand
    pipelines_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipeline_runs_assoc_metrics (definition)
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
                            required: %w'association',
                            properties: {
                              association: {
                                type: 'object',
                                required: %w'metrics',
                                properties: {
                                  metrics: {
                                    type: 'object',
                                    required: %w'nodes',
                                    properties: {
                                      nodes: {
                                        type: 'array',
                                        items: {
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
  
  def self.pipeline_runs_assoc_metrics_schema_full
    pipeline_runs_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipeline_runs_assoc_metrics_schema_rand
    pipeline_runs_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipeline_last_run_assoc_metrics (definition)
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
                      required: %w'association',
                      properties: {
                        association: {
                          type: 'object',
                          required: %w'metrics',
                          properties: {
                            metrics: {
                              type: 'object',
                              required: %w'nodes',
                              properties: {
                                nodes: {
                                  type: 'array',
                                  items: {
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
  
  def self.pipeline_last_run_assoc_metrics_schema_full
    pipeline_last_run_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipeline_last_run_assoc_metrics_schema_rand
    pipeline_last_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipeline_run_assoc_metrics (definition)
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
                      required: %w'association',
                      properties: {
                        association: {
                          type: 'object',
                          required: %w'metrics',
                          properties: {
                            metrics: {
                              type: 'object',
                              required: %w'nodes',
                              properties: {
                                nodes: {
                                  type: 'array',
                                  items: {
                                    oneOf: [
                                      {
                                        type: 'object',
                                        required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                        properties:
                                          GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                                      },
                                      {
                                        type: 'null'
                                      },
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
  
  def self.pipeline_run_assoc_metrics_schema_full
    pipeline_run_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipeline_run_assoc_metrics_schema_rand
    pipeline_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipelines_runs_assoc_metric (definition)
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
                                  required: %w'association',
                                  properties: {
                                    association: {
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
  
  def self.pipelines_runs_assoc_metric_schema_full
    pipeline_run_assoc_metrics(AssocMetricDefinitions.association_metric)
  end
  
  def self.pipelines_runs_assoc_metric_schema_rand
    pipeline_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)
  end
  
  def self.pipelines_last_run_assoc_metric (definition)
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
                            required: %w'association',
                            properties: {
                              association: {
                                type: 'object',
                                required: %w'metrics',
                                properties: {
                                  metrics: {
                                    type: 'object',
                                    required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                    properties:
                                      GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
  
  def self.pipelines_run_assoc_metric (definition)
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
                            required: %w'association',
                            properties: {
                              association: {
                                type: 'object',
                                required: %w'metrics',
                                properties: {
                                  metrics: {
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
  
  def self.pipeline_runs_assoc_metric (definition)
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
                            required: %w'association',
                            properties: {
                              association: {
                                type: 'object',
                                required: %w'metrics',
                                properties: {
                                  metrics: {
                                    type: 'object',
                                    required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                                    properties:
                                      GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
  
  def self.pipeline_last_run_assoc_metric (definition)
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
                      required: %w'association',
                      properties: {
                        association: {
                          type: 'object',
                          required: %w'metrics',
                          properties: {
                            metrics: {
                              type: 'object',
                              required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                              properties:
                                GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
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
  
  def self.pipeline_run_assoc_metric (definition)
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
                      required: %w'association',
                      properties: {
                        association: {
                          type: 'object',
                          required: %w'metrics',
                          properties: {
                            metrics: {
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
end
