require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/query/pipeline_step/support/support'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/step_definitions'

module PipelineStepsQueries
  class << self
  end

  def self.steps_query (definitions)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps {
            ' + GraphqlHelpers.filtered_definitions(definitions, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.step_by_type_query (definition, type)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps(type: "' + type + '") {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.missing_required_sub_field
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps {
            outputs
          }
        }
      }'
    }.to_json
  end

  def self.invalid_argument_value
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps(type: "INVALID") {
            id
          }
        }
      }'
    }.to_json
  end

  def self.invalid_argument_type
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps(type: 1234) {
            id
          }
        }
      }'
    }.to_json
  end

  def self.invalid_field
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps {
            invalid
          }
        }
      }'
    }.to_json
  end

  def self.sub_field_on_invalid_field
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_with_step + '") {
          steps {
            id {
              id
            }
          }
        }
      }'
    }.to_json
  end

end