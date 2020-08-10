require './spec/graphql_api/trendscope/definitions/commit_definitions'

module CommitSupport
  module_function
  
  def commit_schema(definitions)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(definitions, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(definitions, :schema).reduce(&:merge)
        }
      }
    }
  end

  def commit_schema_full
    commit_schema(CommitDefinitions.commit)
  end
end
