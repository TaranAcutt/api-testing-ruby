require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'

module TpvMetricsQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_id_value, :invalid_page_size_value, :invalid_field, :invalid_argument, :invalid_field_with_sub_field, :invalid_argument_value, :missing_required_argument
  end

  def self.pipeline_runs_tpv_metrics (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_runs_tpv_metrics_search (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_with_args (definition, args)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "Global", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'", ' + args + ') {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                    }
                    pageInfo {
                      page
                      pages
                      pageSize
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_filter (args)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "Global", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '" ' + args + ') {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_with_args (args)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'", ' + args + ') {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                  }
                  pageInfo {
                    page
                    pages
                    pageSize
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_last_run_tpv_with_args (args)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'", ' + args + ') {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                  }
                  pageInfo {
                    page
                    pages
                    pageSize
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_tpv_metrics (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_tpv_metrics_search (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] +'") {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_runs_tpv_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'", ' + args + ') {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                  }
                  pageInfo {
                    page
                    pages
                    pageSize
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_tpv_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'", ' + args + ') {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                }
                pageInfo {
                  page
                  pages
                  pageSize
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_tpv_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'", ' + args + ') {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                }
                pageInfo {
                  page
                  pages
                  pageSize
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_tpv_metrics (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_tpv_metrics_search (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] +'") {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_metrics (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                    }
                    totalCount
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_metrics_search (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_last_run_tpv_metrics (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_last_run_tpv_metrics_search (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_metrics (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_metrics_search (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  ###### NEGATIVE QUERIES ######
  
  @missing_required_sub_field =
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    nodes {
                      competitors
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_page_size_value =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  metrics(market: "Global" pageSize: invalid) {
                    nodes {
                      id
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    nodes {
                      invalid
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    nodes {
                      id {
                        id
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  def self.japanese_character_search (definition)
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: "サ") {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.invalid_search_value (definition)
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: 9) {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.missing_search_value (definition)
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", search: ) {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.invalid_filter
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "Global", filter: invalid==invalid ) {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.invalid_operator
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metrics(market: "Global", filter: "trendMetrics.rank=>2" ) {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.tpv_metric, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
end