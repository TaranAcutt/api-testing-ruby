require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/query/demographics_metric/support/demographics_metrics_schema'
require './spec/graphql_api/trendscope/definitions/demographics_metric_definitions'

module DemographicsMetricsQueries
  class << self
    attr_accessor :invalid_field, :invalid_argument_type, :missing_required_argument, :invalid_argument_type, :invalid_argument_value, :invalid_order_by_field, :invalid_order_by_direction
  end

  def self.pipeline_runs_demographics_with_args(metric, args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + metric + ' (' + args + ') { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_demographics_with_args(metric, args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '" ) {
              ' + metric + ' (' + args + ') { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_demographics_with_args(metric, args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
              ' + metric + ' (' + args + ') { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_runs_demographics_metrics(definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_demographics_metrics(definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
              ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_run_demographics_metrics(definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
              ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_demographics_with_args(metric, args)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                demographic (market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '"){
                  ' + metric + ' (' + args + ')
                    { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} totalCount}
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_demographics_with_args(metric, args)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              demographic (market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + metric + ' (' + args + ') { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_last_run_demographics_with_args(metric, args)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + metric + ' (' + args + ') { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_demographics_metrics (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_last_run_demographics_metrics(definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_demographics_metrics(definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.missing_required_sub_field(field)
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                  ' + field + '
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
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                  invalid
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
                  demographic(market: "' + GraphqlDataService.metric_args['market'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                    accountsFollowed {
                      nodes {
                        estimatedSize
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

  @invalid_argument_type =
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: 10) {
                  accountsFollowed {
                    nodes {
                      estimatedSize
                    }
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_order_by_direction =
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                accountsFollowed (orderBy: {field: PERCENTAGE, direction: DOWN}) { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_order_by_field =
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                accountsFollowed (orderBy: {field:  INVALID, direction: DESC}) { nodes  { estimatedSize actualSize percentage} pageInfo { page pageSize pages} }
              }
            }
          }
        }
      }'
    }.to_json

  def self.sub_field_on_invalid_field (field)
    {
      query: '{
        pipelines(pageSize: 1) {
          nodes {
            runs(pageSize: 1) {
              nodes {
                demographic(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", subLens: "' + GraphqlDataService.metric_args['subLens'] + '") {
                  ' + field + ' {
                    nodes {
                      estimatedSize {
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
  end
end