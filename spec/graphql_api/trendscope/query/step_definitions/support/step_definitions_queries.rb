require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/step_definitions_definitions'

module StepDefinitionsQueries
  class << self
    attr_accessor :step_definitions_query, :rand_step_definitions_query, :invalid_field_query, :invalid_sub_field_query
  end

  @step_definitions_query =
    {
      query: '{
        stepDefinitions {
          ' + GraphqlHelpers.filtered_definitions(StepDefinitionsDefinitions.step_definitions, :query).join(' ') + '
        }
      }'
    }.to_json

  @rand_step_definitions_query =
    {
      query: '{
        stepDefinitions {
          ' + GraphqlHelpers.filtered_definitions(StepDefinitionsDefinitions.rand_step_definitions, :query).join(' ') + '
        }
      }'
    }.to_json

  @invalid_field_query =
    {
      query: '{
        stepDefinitions {
          invalid
        }
      }'
    }.to_json

  @invalid_sub_field_query =
    {
      query: '{
        stepDefinitions {
          inputs {
            invalid
          }
        }
      }'
    }.to_json
end