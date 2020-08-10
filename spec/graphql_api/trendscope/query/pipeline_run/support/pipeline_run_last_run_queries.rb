require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/query/pipeline_run/support/support'
require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'

module PipelineRunLastRunQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_field, :invalid_field_with_sub_field, :edges_and_nodes_in_query, :invalid_argument
  end
  
  def self.pipelines_last_run_query(definition)
    { query:
        '{
        pipelines{
          nodes {
            lastRun {
              ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
          }
        }
      }'
    }.to_json
  end
  
  def self.pipeline_last_run_query(definition)
    { query:
        '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '"){
          lastRun {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  @missing_required_sub_field =
    {
      query: '{
        pipeline {
          nodes {
            lastRun {
              tpv
            }
          }
        }
      }'
    }.to_json
  
  @invalid_argument =
    {
      query: '{
        pipeline {
          nodes {
            lastRun(id: "1234") {
              id
            }
          }
        }
      }'
    }.to_json
  
  @invalid_field =
    {
      query: '{
        pipeline {
          nodes {
            lastRun {
              wrong
              reallywrong
              megawrong
              ultrawrong
            }
          }
        }
      }'
    }.to_json
  
  @invalid_field_with_sub_field =
    {
      query: '{
        pipeline {
          nodes {
            lastRun {
              id {
                id
              }
            }
          }
        }
      }'
    }.to_json

end