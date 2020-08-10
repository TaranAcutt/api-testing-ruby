require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamGroupsSupport
  module_function
  
  def stream_groups_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['streamGroups'],
          'properties': {
            'streamGroups': {
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

  def stream_groups_schema_full
    stream_groups_schema(StreamsDefinitions.stream_groups)
  end

  def stream_groups_schema_rand
    stream_groups_schema(StreamsDefinitions.rand_stream_groups)
  end
end
