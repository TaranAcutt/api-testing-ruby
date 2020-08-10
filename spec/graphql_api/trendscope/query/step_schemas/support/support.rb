module StepSchemasSupport
  module_function
  
  def step_schemas_schema(definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['stepSchemas'],
          properties: {
            stepSchemas: {
              type: 'array',
              items: {
                'type': 'object',
                'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                'properties':
                  GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
              }
            }
          }
        }
      }
    }
  end

  def step_schemas_schema_full
    step_schemas_schema(StepSchemasDefinitions.step_schemas)
  end

  def step_schemas_schema_rand
    step_schemas_schema(StepSchemasDefinitions.rand_step_schemas)
  end
end
