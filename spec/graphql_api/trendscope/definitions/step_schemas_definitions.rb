require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/schema_fragments'

module StepSchemasDefinitions
  class << self
    attr_accessor :step_schemas, :rand_step_schemas
  end
  
  @step_schemas = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'schema',
      property_name: 'schema',
      schema: {
        schema: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]
  
  @rand_step_schemas = GraphqlHelpers.property_definition(@step_schemas)
end