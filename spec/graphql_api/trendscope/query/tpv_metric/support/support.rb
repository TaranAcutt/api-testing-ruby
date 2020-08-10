require './spec/graphql_api/trendscope/support/graphql_helpers'

module TpvMetricSupport

  def self.pipelines_runs_tpv_metrics (definition)
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
                        'oneOf': [
                          {
                            'type': 'object',
                            'required': ['nodes'],
                            'properties': {
                              'nodes': {
                                'type': 'array',
                                'items': {
                                  'type': 'object',
                                  'required': %w'tpv',
                                  'properties': {
                                    'tpv': {
                                      'type': 'object',
                                      'required': %w'metrics',
                                      'properties': {
                                        'metrics': {
                                          'oneOf': [
                                            {
                                              'type': 'object',
                                              'required': %w'nodes',
                                              'properties': {
                                                'nodes': {
                                                  'type': 'array',
                                                  'items': {
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

  def self.pipelines_runs_tpv_metrics_full
    pipelines_runs_tpv_metrics(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipelines_runs_tpv_metrics_rand
    pipelines_runs_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipelines_last_run_tpv_metrics (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'metrics',
                                'properties': {
                                  'metrics': {
                                    'oneOf': [
                                      {
                                        'type': 'object',
                                        'required': %w'nodes',
                                        'properties': {
                                          'nodes': {
                                            'type': 'array',
                                            'items': {
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
                                      },
                                      {
                                        'type': 'null'
                                      }
                                    ]
                                  }
                                }
                              }
                            }
                          },
                          {
                            'type': 'null'
                          },
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

  def self.pipelines_last_run_tpv_metrics_full
    pipelines_last_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipelines_last_run_tpv_metrics_rand
    pipelines_last_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipelines_run_tpv_metrics (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'metrics',
                                'properties': {
                                  'metrics': {
                                    'oneOf': [
                                      {
                                        'type': 'object',
                                        'required': %w'nodes',
                                        'properties': {
                                          'nodes': {
                                            'type': 'array',
                                            'items': {
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
                                      },
                                      {
                                        'type': 'null'
                                      }
                                    ]
                                  }
                                }
                              }
                            }
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

  def self.pipelines_run_tpv_metrics_full
    pipelines_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipelines_run_tpv_metrics_rand
    pipelines_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipeline_runs_tpv_metrics (definition)
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
                  'oneOf': [
                    {
                      'type': 'object',
                      'required': ['nodes'],
                      'properties': {
                        'nodes': {
                          'type': 'array',
                          'items': {
                            'type': 'object',
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'metrics',
                                'properties': {
                                  'metrics': {
                                    'oneOf': [
                                      {
                                        'type': 'object',
                                        'required': %w'nodes',
                                        'properties': {
                                          'nodes': {
                                            'type': 'array',
                                            'items': {
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

  def self.pipeline_runs_tpv_metrics_full
    pipeline_runs_tpv_metrics(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipeline_runs_tpv_metrics_rand
    pipeline_runs_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipeline_last_run_tpv_metrics (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'metrics',
                          'properties': {
                            'metrics': {
                              'oneOf': [
                                {
                                  'type': 'object',
                                  'required': %w'nodes',
                                  'properties': {
                                    'nodes': {
                                      'type': 'array',
                                      'items': {
                                        'oneOf': [
                                          {
                                            'type': 'object',
                                            'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                                            'properties':
                                              GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                                          },
                                          { 'type': 'null' }
                                        ]
                                      }
                                    }
                                  }
                                },
                                {
                                  'type': 'null'
                                }
                              ]
                            }
                          }
                        }
                      }
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

  def self.pipeline_last_run_tpv_metrics_full
    pipeline_last_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipeline_last_run_tpv_metrics_rand
    pipeline_last_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipeline_run_tpv_metrics (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'metrics',
                          'properties': {
                            'metrics': {
                              'oneOf': [
                                {
                                  'type': 'object',
                                  'required': %w'nodes',
                                  'properties': {
                                    'nodes': {
                                      'type': 'array',
                                      'items': {
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
                                },
                                {
                                  'type': 'null'
                                }
                              ]
                            }
                          }
                        }
                      }
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

  def self.pipeline_run_tpv_metrics_full
    pipeline_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipeline_run_tpv_metrics_rand
    pipeline_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipelines_runs_tpv_metric (definition)
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
                        'oneOf': [
                          {
                            'type': 'object',
                            'required': ['nodes'],
                            'properties': {
                              'nodes': {
                                'type': 'array',
                                'items': {
                                  'type': 'object',
                                  'required': %w'tpv',
                                  'properties': {
                                    'tpv': {
                                      'type': 'object',
                                      'required': %w'metric',
                                      'properties': {
                                        'metric': {
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

  def self.pipelines_runs_tpv_metric_full
    pipelines_runs_tpv_metric(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipelines_runs_tpv_metric_rand
    pipelines_runs_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipelines_last_run_tpv_metric (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'metric',
                                'properties': {
                                  'metric': {
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
  
  def self.pipelines_last_run_tpv_metric_full
    pipelines_last_run_tpv_metric(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipelines_last_run_tpv_metric_rand
    pipelines_last_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipelines_run_tpv_metric (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'metric',
                                'properties': {
                                  'metric': {
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

  def self.pipelines_run_tpv_metric_full
    pipelines_run_tpv_metric(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipelines_run_tpv_metric_rand
    pipelines_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipeline_runs_tpv_metric (definition)
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
                  'oneOf': [
                    {
                      'type': 'object',
                      'required': ['nodes'],
                      'properties': {
                        'nodes': {
                          'type': 'array',
                          'items': {
                            'type': 'object',
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'metric',
                                'properties': {
                                  'metric': {
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

  def self.pipeline_runs_tpv_metric_full
    pipeline_runs_tpv_metric(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipeline_runs_tpv_metric_rand
    pipeline_runs_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipeline_last_run_tpv_metric (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'metric',
                          'properties': {
                            'metrics': {
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

  def self.pipeline_last_run_tpv_metric_full
    pipeline_last_run_tpv_metric(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipeline_last_run_tpv_metric_rand
    pipeline_last_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipeline_run_tpv_metric (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'metric',
                          'properties': {
                            'metric': {
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
                    },
                    {
                      'type': 'null'
                    },
                  ]
                }
              }
            }
          }
        }
      }
    }
  end

  def self.pipeline_run_tpv_metric_full
    pipeline_run_tpv_metric(TpvMetricDefinitions.tpv_metric)
  end

  def self.pipeline_run_tpv_metric_rand
    pipeline_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)
  end

  def self.pipelines_runs_tpv_overview (definition)
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
                        'oneOf': [
                          {
                            'type': 'object',
                            'required': ['nodes'],
                            'properties': {
                              'nodes': {
                                'type': 'array',
                                'items': {
                                  'type': 'object',
                                  'required': %w'tpv',
                                  'properties': {
                                    'tpv': {
                                      'type': 'object',
                                      'required': %w'overview',
                                      'properties': {
                                        'overview': {
                                          oneOf: [
                                            {
                                              'type': 'array',
                                              'items': {
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

  def self.pipelines_runs_tpv_overview_schema_full
    pipelines_runs_tpv_overview(TpvMetricDefinitions.overview)
  end

  def self.pipelines_runs_tpv_overview_schema_rand
    pipelines_runs_tpv_overview(TpvMetricDefinitions.rand_overview)
  end

  def self.pipelines_last_run_tpv_overview (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'overview',
                                'properties': {
                                  'overview': {
                                    'type': 'array',
                                    'items': {
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

  def self.pipelines_last_run_tpv_overview_schema_full
    pipelines_last_run_tpv_overview(TpvMetricDefinitions.overview)
  end

  def self.pipelines_last_run_tpv_overview_schema_rand
    pipelines_last_run_tpv_overview(TpvMetricDefinitions.rand_overview)
  end

  def self.pipelines_run_tpv_overview (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'overview',
                                'properties': {
                                  'overview': {
                                    'type': 'array',
                                    'items': {
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

  def self.pipelines_run_tpv_overview_schema_full
    pipelines_run_tpv_overview(TpvMetricDefinitions.overview)
  end

  def self.pipelines_run_tpv_overview_schema_rand
    pipelines_run_tpv_overview(TpvMetricDefinitions.rand_overview)
  end

  def self.pipeline_runs_tpv_overview (definition)
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
                  'oneOf': [
                    {
                      'type': 'object',
                      'required': ['nodes'],
                      'properties': {
                        'nodes': {
                          'type': 'array',
                          'items': {
                            'type': 'object',
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'overview',
                                'properties': {
                                  'overview': {
                                    'type': 'array',
                                    'items': {
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

  def self.pipeline_runs_tpv_overview_schema_full
    pipeline_runs_tpv_overview(TpvMetricDefinitions.overview)
  end

  def self.pipeline_runs_tpv_overview_schema_rand
    pipeline_runs_tpv_overview(TpvMetricDefinitions.rand_overview)
  end

  def self.pipeline_last_run_tpv_overview (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'overview',
                          'properties': {
                            'overview': {
                              'type': 'array',
                              'items': {
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

  def self.pipeline_last_run_tpv_overview_schema_full
    pipeline_last_run_tpv_overview(TpvMetricDefinitions.overview)
  end

  def self.pipeline_last_run_tpv_overview_schema_rand
    pipeline_last_run_tpv_overview(TpvMetricDefinitions.rand_overview)
  end

  def self.pipeline_run_tpv_overview (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'overview',
                          'properties': {
                            'overview': {
                              'type': 'array',
                              'items': {
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

  def self.pipeline_run_tpv_overview_schema_full
    pipeline_run_tpv_overview(TpvMetricDefinitions.overview)
  end

  def self.pipeline_run_tpv_overview_schema_rand
    pipeline_run_tpv_overview(TpvMetricDefinitions.rand_overview)
  end

  def self.pipelines_runs_tpv_meta (definition)
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
                        'oneOf': [
                          {
                            'type': 'object',
                            'required': ['nodes'],
                            'properties': {
                              'nodes': {
                                'type': 'array',
                                'items': {
                                  'type': 'object',
                                  'required': %w'tpv',
                                  'properties': {
                                    'tpv': {
                                      'type': 'object',
                                      'required': %w'meta',
                                      'properties': {
                                        'meta': {
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

  def self.pipelines_runs_tpv_meta_schema_full
    pipelines_runs_tpv_meta(TpvMetricDefinitions.meta)
  end

  def self.pipelines_runs_tpv_meta_schema_rand
    pipelines_runs_tpv_meta(TpvMetricDefinitions.rand_meta)
  end

  def self.pipelines_last_run_tpv_meta (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'meta',
                                'properties': {
                                  'meta': {
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

  def self.pipelines_last_run_tpv_meta_schema_full
    pipelines_last_run_tpv_meta(TpvMetricDefinitions.meta)
  end

  def self.pipelines_last_run_tpv_meta_schema_rand
    pipelines_last_run_tpv_meta(TpvMetricDefinitions.rand_meta)
  end

  def self.pipelines_run_tpv_meta (definition)
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
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'meta',
                                'properties': {
                                  'meta': {
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

  def self.pipelines_run_tpv_meta_schema_full
    pipelines_run_tpv_meta(TpvMetricDefinitions.meta)
  end

  def self.pipelines_run_tpv_meta_schema_rand
    pipelines_run_tpv_meta(TpvMetricDefinitions.rand_meta)
  end

  def self.pipeline_runs_tpv_meta (definition)
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
                  'oneOf': [
                    {
                      'type': 'object',
                      'required': ['nodes'],
                      'properties': {
                        'nodes': {
                          'type': 'array',
                          'items': {
                            'type': 'object',
                            'required': %w'tpv',
                            'properties': {
                              'tpv': {
                                'type': 'object',
                                'required': %w'meta',
                                'properties': {
                                  'meta': {
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

  def self.pipeline_runs_tpv_meta_schema_full
    pipeline_runs_tpv_meta(TpvMetricDefinitions.meta)
  end

  def self.pipeline_runs_tpv_meta_schema_rand
    pipeline_runs_tpv_meta(TpvMetricDefinitions.rand_meta)
  end

  def self.pipeline_last_run_tpv_meta (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'meta',
                          'properties': {
                            'meta': {
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

  def self.pipeline_last_run_tpv_meta_schema_full
    pipeline_last_run_tpv_meta(TpvMetricDefinitions.meta)
  end

  def self.pipeline_last_run_tpv_meta_schema_rand
    pipeline_last_run_tpv_meta(TpvMetricDefinitions.rand_meta)
  end

  def self.pipeline_run_tpv_meta (definition)
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
                      'required': %w'tpv',
                      'properties': {
                        'tpv': {
                          'type': 'object',
                          'required': %w'meta',
                          'properties': {
                            'meta': {
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

  def self.pipeline_run_tpv_meta_schema_full
    pipeline_run_tpv_meta(TpvMetricDefinitions.meta)
  end

  def self.pipeline_run_tpv_meta_schema_rand
    pipeline_run_tpv_meta(TpvMetricDefinitions.rand_meta)
  end
end
