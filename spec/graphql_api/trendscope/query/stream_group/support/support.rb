require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamGroupSupport
  module_function
  
  def stream_group_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['streamGroup'],
          'properties': {
            'streamGroup': {
              'type': 'object',
              'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
              'properties':
                GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
            }
          }
        }
      }
    }
  end

  def stream_group_schema_full
    stream_group_schema(StreamsDefinitions.stream_group)
  end

  def stream_group_schema_rand
    stream_group_schema(StreamsDefinitions.rand_stream_group)
  end
end
