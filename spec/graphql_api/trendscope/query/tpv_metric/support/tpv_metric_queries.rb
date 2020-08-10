require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'

module TpvMetricQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_id_value, :invalid_field, :invalid_argument, :invalid_field_with_sub_field, :invalid_argument_value, :missing_required_argument
  end

  def self.pipeline_runs_tpv_metric (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_tpv_metric (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_tpv_metric (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_metric (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
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

  def self.pipelines_last_run_tpv_metric (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_metric (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
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
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                volume {
                  metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    volume
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_argument =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                tpv {
                  metric(market: "tuff", invalid: "stuff", lens: "things", subLens: "guff") {
                    market
                    category
                    lens
                    subLens
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_argument_value =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                tpv {
                  metric(market: "tuff", category: "stuff", lens: "things", subLens: "guff") {
                    market
                    category
                    lens
                    subLens
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @missing_required_argument =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                tpv {
                  metric(market: "tuff" category: "stuff" lens: "things") {
                    market
                    category
                    lens
                    subLens
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
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                tpv {
                  metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    id {
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
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                tpv {
                  metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                    invalid
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

end