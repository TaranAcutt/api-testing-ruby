require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/query/pipeline/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module PipelineQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_id_value, :invalid_field, :invalid_field_with_sub_field, :edges_and_nodes_in_query, :invalid_pipeline_argument
  end

  def self.pipeline_query (definition)
    { query:
      '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
        }
      }'
    }.to_json
  end

  def self.pipeline_by_id_query (pipeline_id)
    { query:
        '{
        pipeline(id: "' + pipeline_id + '") {
          id
          name
          status
        }
      }'
    }.to_json
  end
  
  @missing_required_sub_field =
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          steps
        }
      }'
    }.to_json

  @invalid_pipeline_argument =
    {
      query: '{
        pipeline(description: "12345") {
          id
        }
      }'
    }.to_json
  
  @invalid_field =
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          invalid
          wrong
          superWrong
          megaWrong
        }
      }'
    }.to_json
  
  @invalid_field_with_sub_field =
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          id {
            id
          }
        }
      }'
    }.to_json
end