require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'

module TpvOverviewQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field
  end

  def self.pipeline_runs_tpv_overview (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_runs_tpv_overview_search (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] + '" ) {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
  
  def self.pipeline_last_run_tpv_overview (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_tpv_overview_search (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_tpv_overview (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_tpv_overview_search (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_overview (definition)
    {
      query: '{
        pipelines (filter: "status==COMPLETE") {
          nodes {
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
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

  def self.pipelines_runs_tpv_overview_search (definition)
    {
      query: '{
        pipelines (filter: "status==COMPLETE") {
          nodes {
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] + '") {
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

  def self.pipelines_last_run_tpv_overview (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_last_run_tpv_overview_search (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_overview (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_overview_search (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "' + GraphqlDataService.metric_args['subLens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  @invalid_field =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                    invalid
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  def self.invalid_search_length (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: "t") {
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

  def self.invalid_search_value (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: 9) {
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

  def self.missing_search_value (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", search: ) {
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

  @invalid_field_with_sub_field =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  overview(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                    phase {
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
end