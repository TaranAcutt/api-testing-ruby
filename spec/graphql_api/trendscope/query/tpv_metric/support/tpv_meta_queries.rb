require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module TpvMetaQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_id_value, :invalid_field, :invalid_argument, :invalid_field_with_sub_field, :invalid_argument_value, :missing_required_argument
  end

  def self.pipeline_runs_tpv_meta (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              tpv {
                meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_last_run_tpv_meta (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          lastRun {
            tpv {
              meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end
  
  def self.pipeline_run_tpv_meta (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            tpv {
              meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_tpv_meta (definition)
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                tpv {
                  meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
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

  def self.pipelines_last_run_tpv_meta (definition)
    {
      query: '{
        pipelines {
          nodes {
            lastRun {
              tpv {
                meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_run_tpv_meta (definition)
    {
      query: '{
        pipelines {
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv {
                meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
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
                  meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
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
        pipelines {
          nodes{
            runs {
              nodes {
                tpv {
                  meta(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '") {
                    market {
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