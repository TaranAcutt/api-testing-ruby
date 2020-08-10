require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/step_schemas_definitions'

module PipelineTagsQueries
  class << self
    attr_accessor :pipeline_tags_query, :pipeline_tags_with_empty_search_query, :pipeline_tags_with_search_query, :invalid_search_type, :invalid_sub_field
  end

  @pipeline_tags_query =
    {
      query: '{
        pipelineTags {
          nodes
        }
      }'
    }.to_json

  @pipeline_tags_with_empty_search_query =
    {
      query: '{
        pipelineTags (search: "") {
          nodes
        }
      }'
    }.to_json

  @pipeline_tags_with_search_query =
    {
      query: '{
        pipelineTags (search: "' + GraphqlDataService.pipeline_tag + '") {
          nodes
        }
      }'
    }.to_json

  @invalid_search_type =
    {
      query: '{
        stepSchemas {
          stepSchemas
        }
      }'
    }.to_json

  @invalid_sub_field =
    {
      query: '{
        stepSchemas {
          schemas {
            invalid
          }
        }
      }'
    }.to_json
end