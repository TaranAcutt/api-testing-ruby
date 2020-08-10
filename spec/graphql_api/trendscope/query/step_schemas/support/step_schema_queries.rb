require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/step_schemas_definitions'

module StepSchemasQueries
  class << self
    attr_accessor :step_schemas_query, :rand_step_schemas_query, :invalid_field_query, :invalid_sub_field_query
  end

  @step_schemas_query =
    {
      query: '{
        stepSchemas {
          ' + GraphqlHelpers.filtered_definitions(StepSchemasDefinitions.step_schemas, :query).join(' ') + '
        }
      }'
    }.to_json

  @rand_step_schemas_query =
    {
      query: '{
        stepSchemas {
          ' + GraphqlHelpers.filtered_definitions(StepSchemasDefinitions.rand_step_schemas, :query).join(' ') + '
        }
      }'
    }.to_json

  @invalid_field_query =
    {
      query: '{
        stepSchemas {
          stepSchemas
        }
      }'
    }.to_json

  @invalid_sub_field_query =
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