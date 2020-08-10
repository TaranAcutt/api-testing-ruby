module StepDefinitionsSupport
  module_function

  def step_definitions_schema(definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['stepDefinitions'],
          properties: {
            stepDefinitions: {
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
  
  def step_definitions_schema_full
    step_definitions_schema(StepDefinitionsDefinitions.step_definitions)
  end

  def step_definitions_schema_rand
    step_definitions_schema(StepDefinitionsDefinitions.rand_step_definitions)
  end
end
