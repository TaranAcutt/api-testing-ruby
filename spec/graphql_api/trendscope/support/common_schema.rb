require './spec/graphql_api/trendscope/support/schema_fragments'

module CommonSchema
  module_function

  def graphql_error_schema
    {
      type:  'array',
      items: {
        type: 'object',
        required: %w(message locations),
        properties: {
          message: SchemaFragments.non_nullable_string,
          locations: {
            type: 'array',
            items: {
              type: 'object',
              required: %w(line column),
              properties: {
                line: SchemaFragments.non_nullable_integer,
                column: SchemaFragments.non_nullable_integer
              }
            }
          }
        }
      }
    }
  end
end
