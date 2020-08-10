require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/common_definitions'

module PipelineRunDefinitions
  class << self
    attr_accessor :pipeline_run, :rand_pipeline_run, :pipeline_run_step_logs, :pipeline_run_step_list_item, :pipeline_run_step, :rand_pipeline_run_step, :pipeline_run_step_logs,
      :step_meta_data_metric, :rand_step_meta_data_metric, :output_cleaned_date, :rand_output_cleaned_date
  end
  
  @output_cleaned_date = [
    {
      query: 'cleanedDate',
      property_name: 'cleanedDate',
      schema: {
        cleanedDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
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
    }
  ]
  
  @rand_output_cleaned_date = GraphqlHelpers.property_definition(@output_cleaned_date)
  
  @step_meta_data_metric = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'volume { ' + GraphqlHelpers.filtered_definitions(Common.int_time_series, :query).join(' ') + ' }',
      property_name: 'volume',
      schema: {
        volume: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(Common.int_time_series, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(Common.int_time_series, :schema).reduce(&:merge)
        }
      }
    },
    {
      query: 'sources { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'sources',
      schema: {
        sources: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'languages { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'languages',
      schema: {
        languages: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'countries { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'countries',
      schema: {
        countries: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    },
    {
      query: 'sentiment { ' + GraphqlHelpers.filtered_definitions(Common.named_time_series, :query).join(' ') + ' }',
      property_name: 'sentiment',
      schema: {
        sentiment: {
          type: 'array',
          items: {
            type: 'object',
            required: GraphqlHelpers.filtered_definitions(Common.named_time_series, :property_name),
            properties:
              GraphqlHelpers.filtered_definitions(Common.named_time_series, :schema).reduce(&:merge)
          }
        }
      }
    }
  ]
  
  @rand_step_meta_data_metric = GraphqlHelpers.property_definition(@step_meta_data_metric)
  
  @pipeline_run_step_logs = [
    {
      query: 'controller',
      property_name: 'controller',
      schema: {
        controller: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'stderr',
      property_name: 'stderr',
      schema: {
        stderr: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'containers',
      property_name: 'containers',
      schema: {
        containers: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'containerStdout',
      property_name: 'containerStdout',
      schema: {
        containerStdout: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'containerStderr',
      property_name: 'containerStderr',
      schema: {
        containerStderr: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    }
  ]
  
  @pipeline_run_step_list_item = [
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
      query: 'applicationUri',
      property_name: 'applicationUri',
      schema: {
        applicationUri: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'stepId',
      property_name: 'stepId',
      schema: {
        stepId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_run_status.json"
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
      query: 'clusterId',
      property_name: 'clusterId',
      schema: {
        clusterId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'clusterStepId',
      property_name: 'clusterStepId',
      schema: {
        clusterStepId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'downloadableOutputs',
      property_name: 'downloadableOutputs',
      schema: {
        downloadableOutputs: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'outputCleanedDates { ' + GraphqlHelpers.filtered_definitions(@output_cleaned_date, :query).join(' ') + ' }',
      property_name: 'outputCleanedDates',
      schema: {
        outputCleanedDates: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@output_cleaned_date, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(@output_cleaned_date, :schema).reduce(&:merge)
                  },
                  {
                    type: 'null'
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
      query: 'clusterName',
      property_name: 'clusterName',
      schema: {
        clusterName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'type',
      property_name: 'type',
      schema: {
        type: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'runStartDate',
      property_name: 'runStartDate',
      schema: {
        runStartDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
        }
      }
    },
    {
      query: 'runEndDate',
      property_name: 'runEndDate',
      schema: {
        runEndDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
        }
      }
    }
  ]
  
  @pipeline_run_step_logs = [
    {
      query: 'controller',
      property_name: 'controller',
      schema: {
        controller: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'stderr',
      property_name: 'stderr',
      schema: {
        stderr: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'containers',
      property_name: 'containers',
      schema: {
        containers: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'containerStdout',
      property_name: 'containerStdout',
      schema: {
        containerStdout: {
          '$ref': "#{SchemaHelpers.schemas}/support/string.json"
        }
      }
    },
    {
      query: 'containerStderr',
      property_name: 'containerStderr',
      schema: {
        containerStderr: {
          '$ref': "#{SchemaHelpers.schemas}/support/string.json"
        }
      }
    }
  ]
  
  @pipeline_run_step = [
    {
      query: 'stepId',
      property_name: 'stepId',
      schema: {
        stepId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_run_status.json"
        }
      }
    },
    {
      query: 'clusterId',
      property_name: 'clusterId',
      schema: {
        clusterId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'clusterStepId',
      property_name: 'clusterStepId',
      schema: {
        clusterStepId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'clusterName',
      property_name: 'clusterName',
      schema: {
        clusterName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'runStartDate',
      property_name: 'runStartDate',
      schema: {
        runStartDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
        }
      }
    },
    {
      query: 'runEndDate',
      property_name: 'runEndDate',
      schema: {
        runEndDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
        }
      }
    },
    {
      query: 'applicationUri',
      property_name: 'applicationUri',
      schema: {
        applicationUri: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'outputCleanedDates { ' + GraphqlHelpers.filtered_definitions(@output_cleaned_date, :query).join(' ') + ' }',
      property_name: 'outputCleanedDates',
      schema: {
        outputCleanedDates: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@output_cleaned_date, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(@output_cleaned_date, :schema).reduce(&:merge)
                  },
                  {
                    type: 'null'
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
      query: 'config',
      property_name: 'config',
      schema: {
        config: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'metaDataMetrics { ' + GraphqlHelpers.filtered_definitions(@step_meta_data_metric, :query).join(' ') + ' }',
      property_name: 'metaDataMetrics',
      schema: {
        metaDataMetrics: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@step_meta_data_metric, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(@step_meta_data_metric, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'downloadableOutputs',
      property_name: 'downloadableOutputs',
      schema: {
        downloadableOutputs: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
      query: 'type',
      property_name: 'type',
      schema: {
        type: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
    }
  ]
  
  @rand_pipeline_run_step = GraphqlHelpers.property_definition(@pipeline_run_step)
  
  @pipeline_run = [
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
      query: 'environment',
      property_name: 'environment',
      schema: {
        environment: {
          oneOf: [
            {
              '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json",
              enum: %w'AWS DATABRICKS'
            },
            {
              type: 'null'
            }
          ]
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
      query: 'endDate',
      property_name: 'endDate',
      schema: {
        endDate: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/date.json"
        }
      }
    },
    {
      query: 'outputId',
      property_name: 'outputId',
      schema: {
        outputId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'pipelineRevisionNumber',
      property_name: 'pipelineRevisionNumber',
      schema: {
        pipelineRevisionNumber: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
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
      query: 'runStartDate',
      property_name: 'runStartDate',
      schema: {
        runStartDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
        }
      }
    },
    {
      query: 'runEndDate',
      property_name: 'runEndDate',
      schema: {
        runEndDate: {
          '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
        }
      }
    },
    {
      query: 'clusterId',
      property_name: 'clusterId',
      schema: {
        clusterId: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'clusterName',
      property_name: 'clusterName',
      schema: {
        clusterName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'result',
      property_name: 'result',
      schema: {
        result: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'status',
      property_name: 'status',
      schema: {
        status: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/pipeline_run_status.json"
        }
      }
    },
    {
      query: 'qaMetrics { heroChartMetrics { category } }',
      property_name: 'qaMetrics',
      schema: {
        qaMetrics: {
          type: 'object',
          required: %w'heroChartMetrics',
          properties: {
            heroChartMetrics: {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: %w'category',
                    properties: {
                      category: {
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
        }
      }
    },
    {
      query: 'steps { ' + GraphqlHelpers.filtered_definitions(@pipeline_run_step_list_item, :query).join(' ') + ' }',
      property_name: 'steps',
      schema: {
        steps: {
          oneOf: [
            {
              type: 'array',
              items: {
                oneOf: [
                  {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(@pipeline_run_step_list_item, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(@pipeline_run_step_list_item, :schema).reduce(&:merge)
                  },
                  {
                    type: 'null'
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
      query: 'step ( id: "' + GraphqlDataService.step_id + '" ) { ' + GraphqlHelpers.filtered_definitions(@pipeline_run_step, :query).join(' ') + ' }',
      property_name: 'step',
      schema: {
        step: {
          oneOf: [
            {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(@pipeline_run_step, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(@pipeline_run_step, :schema).reduce(&:merge)
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'tpv { metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") { id } }',
      property_name: 'tpv',
      schema: {
        tpv: {
          type: 'object',
          required: %w'metric',
          properties: {
            metric: {
              oneOf: [
                {
                  type: 'object',
                  required: %w'id',
                  additionalProperties: false,
                  properties: {
                    id: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'demographicMeans { means(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") { nodes { id } } }',
      property_name: 'demographicMeans',
      schema: {
        demographicMeans: {
          type: 'object',
          required: %w'means',
          properties: {
            means: {
              type: 'object',
              required: %w'nodes',
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: %w'id',
                    properties: {
                      id: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'association { metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") { nodes  { id } } }',
      property_name: 'association',
      schema: {
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
                    type: 'object',
                    required: %w'id',
                    properties: {
                      id: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'volume { metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") { id } }',
      property_name: 'volume',
      schema: {
        volume: {
          type: 'object',
          required: %w'metric',
          properties: {
            metric: {
              oneOf: [
                {
                  type: 'object',
                  required: %w'id',
                  additionalProperties: false,
                  properties: {
                    id: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
      query: 'demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '"){ accountsFollowed {nodes { estimatedSize } } }',
      property_name: 'demographic',
      schema: {
        demographic: {
          type: 'object',
          required: %w'accountsFollowed',
          properties: {
            accountsFollowed: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: %w'estimatedSize',
                    additionalProperties: false,
                    properties: {
                      estimatedSize: {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
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
      query: 'clusterMetrics { association (market: "' + GraphqlDataService.metric_args['market'] + '", cluster: "' + GraphqlDataService.cluster_name + '"){ id } }',
      property_name: 'clusterMetrics',
      schema: {
        clusterMetrics: {
          type: 'object',
          required: %w'association',
          properties: {
            association: {
              anyOf: [
                {
                  type: 'object',
                  required: %w'id',
                  additionalProperties: false,
                  properties: {
                    id: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
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
  ]
  
  @rand_pipeline_run = GraphqlHelpers.property_definition(@pipeline_run)
end
