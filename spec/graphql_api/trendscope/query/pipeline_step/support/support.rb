require './spec/graphql_api/trendscope/definitions/step_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module StepSupport
  module_function
  
  def pipelines_steps (definitions)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelines'],
          properties: {
            pipelines: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: ['steps'],
                    properties: {
                      steps: {
                        oneOf: [
                          {
                            type: 'array',
                            items: {
                              type: 'object',
                              required: GraphqlHelpers.filtered_definitions(definitions, :property_name),
                              properties:
                                GraphqlHelpers.filtered_definitions(definitions, :schema).reduce(&:merge)
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
        }
      }
    }
  end

  def pipelines_steps_schema_full
    pipelines_steps(StepDefinitions.step)
  end

  def pipelines_steps_schema_rand
    pipelines_steps(StepDefinitions.rand_step)
  end

  def pipeline_steps (definitions)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipeline'],
          properties: {
            pipeline: {
              type: 'object',
              required: ['steps'],
              properties: {
                steps: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(definitions, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(definitions, :schema).reduce(&:merge)
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def pipeline_steps_schema_full
    pipeline_steps(StepDefinitions.step)
  end

  def pipeline_steps_schema_rand
    pipeline_steps(StepDefinitions.rand_step)
  end
end