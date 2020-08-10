module PipelineTemplatesSupport
  module_function
  
  def pipeline_templates_schema(definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelineTemplates'],
          properties: {
            pipelineTemplates: {
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
  
  def pipeline_templates_schema_full
    pipeline_templates_schema(PipelineTemplatesDefinitions.pipeline_templates)
  end
  
  def pipeline_templates_schema_rand
    pipeline_templates_schema(PipelineTemplatesDefinitions.rand_pipeline_templates)
  end
end
