require './spec/graphql_api/trendscope/support/graphql_helpers'

module PipelineSupport
  
  def self.pipeline_schema (definition)
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
              required: GraphqlHelpers.filtered_definitions(definition, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
            }
          }
        }
      }
    }
  end

  def self.pipeline_schema_full
    pipeline_schema(PipelineDefinitions.pipeline)
  end

  def self.pipeline_schema_rand
    pipeline_schema(PipelineDefinitions.rand_pipeline)
  end


  def self.pipelines_schema (definition)
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
                    required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def self.pipelines_schema_full
    pipelines_schema(PipelineDefinitions.pipeline)
  end

  def self.pipelines_schema_rand
    pipelines_schema(PipelineDefinitions.rand_pipeline)
  end
end
