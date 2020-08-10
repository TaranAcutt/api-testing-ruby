require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'
require './spec/graphql_api/trendscope/query/pipeline_run/support/support'

module PipelineRunQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_id_value, :invalid_field, :invalid_field_with_sub_field, :edges_and_nodes_in_query, :invalid_pipeline_argument
  end
  
  def self.pipeline_run_query (definition)
    { query:
        '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '"){
          run(id: "' + GraphqlDataService.pipeline_run_id + '") {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  def self.pipelines_run_query (definition)
    { query:
        '{
        pipelines{
          nodes {
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
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
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              tpv
            }
          }
        }
      }'
    }.to_json
  
  @invalid_id_value =
    {
      query: '{
        pipeline {
          nodes {
            run(id: 123456) {
              id
            }
          }
        }
      }'
    }.to_json
  
  @invalid_pipeline_argument =
    {
      query: '{
        pipeline {
          nodes {
            run(description: "invalid") {
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
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
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
            run(id: "' + GraphqlDataService.pipeline_run_id + '") {
              id {
                id
              }
            }
          }
        }
      }'
    }.to_json

end