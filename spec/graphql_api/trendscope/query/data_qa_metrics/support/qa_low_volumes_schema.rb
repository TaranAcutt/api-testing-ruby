require './spec/graphql_api/trendscope/support/graphql_helpers'

module QaLowVolumesSchema
  module_function
  
  def qa_low_volumes_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['dataQAMetrics'],
          properties: {
            dataQAMetrics: {
              type: 'object',
              required: ['qaLowVolumes'],
              properties: {
                qaLowVolumes: {
                  oneOf: [
                    {
                      type: 'array',
                      items: {
                        oneOf: [
                          {
                            type: 'object',
                            required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                            properties: GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                          },
                          {
                            type: 'null'
                          }
                        ]
                      }
                    },
                    {
                      type: 'null'
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  end

  def qa_low_volumes_full
    qa_low_volumes_schema(DataQaMetricsDefinitions.qa_low_volumes)
  end

  def qa_low_volumes_rand
    qa_low_volumes_schema(DataQaMetricsDefinitions.rand_qa_low_volumes)
  end
  
end
