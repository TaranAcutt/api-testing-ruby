require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamsSupport
  module_function
  
  def streams_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['streams'],
          'properties': {
            'streams': {
              'type': 'object',
              'required': ['nodes'],
              'properties': {
                'nodes': {
                  'type': 'array',
                  'items': {
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
      }
    }
  end
  
  def streams_schema_full
    streams_schema(StreamsDefinitions.stream)
  end
  
  def streams_schema_rand
    streams_schema(StreamsDefinitions.rand_stream)
  end
end
