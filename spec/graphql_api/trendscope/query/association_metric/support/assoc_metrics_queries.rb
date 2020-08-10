require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssocMetricsQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_page_size_value, :invalid_field, :invalid_field_with_sub_field, :invalid_order_by_field, :invalid_order_by_direction
  end


  def self.pipeline_runs_assoc_metrics(definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              association {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipeline_last_run_assoc_metrics(definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            association {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipeline_run_assoc_metrics (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            association {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipelines_runs_assoc_with_filter (filter)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "Global", category: "Food Elements", lens: "Ingredients", subLens: "Chocolate", filter: "' + filter + '") {
                    nodes {
                      association { category lens subLens } volume { totalValue percentChange dayOfWeek timeOfDay values }
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

  def self.pipelines_runs_assoc_with_args (args)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", ' + args + ') {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :query).join(' ') + '
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

  def self.pipelines_run_assoc_with_args (args)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              association {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", ' + args + ') {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :query).join(' ') + '
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

  def self.pipelines_last_run_assoc_with_args (args)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              association {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", ' + args + ') {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :query).join(' ') + '
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

  def self.pipelines_runs_assoc_metrics(definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipelines_last_run_assoc_metrics (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              association {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipelines_run_assoc_metrics (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              association {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipeline_runs_assoc_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              association {
                metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", ' + args + ') {
                  nodes {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :query).join(' ') + '
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

  def self.pipeline_run_assoc_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            association {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", ' + args + ') {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :query).join(' ') + '
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

  def self.pipeline_last_run_assoc_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            association {
              metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", ' + args + ') {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :query).join(' ') + '
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


  @missing_required_sub_field =
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                    nodes {
                      association
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
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '" pageSize: invalid) {
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
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.invalid_filter
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "Global", category: "Food Elements", lens: "Ingredients", subLens: "Chocolate", filter: invalid==invalid) {
                    nodes {
                      association { category lens subLens } volume { totalValue percentChange dayOfWeek timeOfDay values }
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
                association {
                  metrics(market: "Global", category: "Food Elements", lens: "Ingredients", subLens: "Chocolate", filter: "association.category=>1") {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :query).join(' ') + '
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

  @invalid_order_by_direction =
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", orderBy: {field: VOLUME, direction: DOWN}) {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :query).join(' ') + '
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json


  @invalid_order_by_field =
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  metrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '", orderBy: {field: INVALID, direction: ASC}) {
                    nodes {
                      ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.association_metric, :query).join(' ') + '
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