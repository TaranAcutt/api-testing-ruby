require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/pipeline_templates_definitions'

module PipelineTemplatesQueries
  class << self
    attr_accessor :pipeline_templates_query, :rand_pipeline_templates_query, :invalid_field_query, :invalid_sub_field_query
  end

  @pipeline_templates_query =
    {
      query: '{
        pipelineTemplates {
          ' + GraphqlHelpers.filtered_definitions(PipelineTemplatesDefinitions.pipeline_templates, :query).join(' ') + '
        }
      }'
    }.to_json

  @rand_pipeline_templates_query =
    {
      query: '{
        pipelineTemplates {
          ' + GraphqlHelpers.filtered_definitions(PipelineTemplatesDefinitions.rand_pipeline_templates, :query).join(' ') + '
        }
      }'
    }.to_json

  @invalid_field_query =
    {
      query: '{
        pipelineTemplates {
          invalid
        }
      }'
    }.to_json

  @invalid_sub_field_query =
    {
      query: '{
        pipelineTemplates {
          template {
            invalid
          }
        }
      }'
    }.to_json
end