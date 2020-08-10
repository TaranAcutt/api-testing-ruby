module VersionSupport
  module_function
  
  def version_schema(definitions)
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

  def version_schema_full
    version_schema(VersionDefinitions.version)
  end

  def version_schema_random
    version_schema(VersionDefinitions.rand_version)
  end
end
