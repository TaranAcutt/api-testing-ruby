require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/query/volume_metric/support/support'
require './spec/graphql_api/trendscope/definitions/volume_metric_definitions'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module VolumeMetricQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_field, :invalid_field_with_sub_field, :invalid_argument, :invalid_arg_type, :missing_required_argument
  end

  def self.pipeline_runs_volume_metric (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              volume {
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

  def self.pipeline_last_run_volume_metric (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            volume {
              metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_volume_metric (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            volume {
              metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] +'") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_volume_metric (definition)
    {
      query: '{
        pipelines (filter: "status == COMPLETE", pageSize: 50){
          nodes {
            runs {
              nodes {
                volume {
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

  def self.pipelines_last_run_volume_metric (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              volume {
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

  def self.pipelines_run_volume_metric (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              volume {
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
                volume {
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

  @invalid_field =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                volume {
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

  @missing_required_argument =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                volume {
                  metric {
                    id
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_arg_type =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                volume {
                  metric(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: 10) {
                    invalid
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
                volume {
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

end