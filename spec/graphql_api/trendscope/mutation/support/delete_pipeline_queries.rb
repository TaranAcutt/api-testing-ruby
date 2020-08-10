require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module DeletePipelineQueries
  class << self
    attr_accessor :invalid_argument, :invalid_argument_type
  end

  ###VALID QUERIES###

  def self.delete_pipeline_mutation_query(pipeline_id)
    {
      query: 'mutation {
        deletePipeline(pipelineId: "' + pipeline_id + '") {
          id
          name
          status
        }
      }'
    }.to_json
  end

  ###INVALID QUERIES###

  @invalid_argument =
    {
      query: 'mutation {
        deletePipeline(pipelineId: "INVALID") {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json

  @invalid_argument_type =
    {
      query: 'mutation {
        deletePipeline(pipelineId: 2) {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json
end