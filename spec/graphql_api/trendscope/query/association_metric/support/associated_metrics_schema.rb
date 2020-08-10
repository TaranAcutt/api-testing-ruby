require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssociatedMetricsSchema
  
  def self.pipeline_runs_associated_metrics (definition)
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
                            required: %w'associatedMetrics',
                            properties: {
                              associatedMetrics: {
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
                }
              }
            }
          }
        }
      }
    }
  end
  
  def self.pipeline_runs_associated_metrics_full
    pipeline_runs_associated_metrics(AssocMetricDefinitions.associated)
  end
  
  def self.pipeline_runs_associated_metrics_rand
    pipeline_runs_associated_metrics(AssocMetricDefinitions.rand_associated)
  end
  
  def self.pipelines_runs_associated_metrics (definition)
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
                                  required: %w'associatedMetrics',
                                  properties: {
                                    associatedMetrics: {
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
  
  def self.pipelines_runs_associated_metrics_full
    pipelines_runs_associated_metrics(AssocMetricDefinitions.associated)
  end
  
  def self.pipelines_runs_associated_metrics_rand
    pipelines_runs_associated_metrics(AssocMetricDefinitions.rand_associated)
  end
end
