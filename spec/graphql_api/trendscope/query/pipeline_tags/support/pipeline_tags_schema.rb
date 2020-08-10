module PipelineTagsSchema
  module_function
  
  def pipeline_tags_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelineTags'],
          properties: {
            pipelineTags: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    oneOf: [
                      {
                        '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
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
  end
end
