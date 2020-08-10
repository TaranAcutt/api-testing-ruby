require './spec/graphql_api/trendscope/support/graphql_helpers'

module QaDemographicsSchema
  module_function
  
  def qa_demographics_schema (definition)
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
              required: ['qaDemographics'],
              properties: {
                qaDemographics: {
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
  
  def qa_demographics_full
    qa_demographics_schema(DataQaMetricsDefinitions.qa_demographics)
  end
  
  def qa_demographics_rand
    qa_demographics_schema(DataQaMetricsDefinitions.rand_qa_demographics)
  end
end
