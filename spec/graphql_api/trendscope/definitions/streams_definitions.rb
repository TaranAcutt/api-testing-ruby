require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamsDefinitions
  class << self
    attr_accessor :stream_group, :stream, :stream_groups, :rand_stream, :rand_stream_group, :rand_stream_groups
  end

  @stream = [
    {
      query: 'internalKey',
      property_name: 'internalKey',
      schema: {
        internalKey: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'source',
      property_name: 'source',
      schema: {
        source: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    }
  ]

  @rand_stream = GraphqlHelpers.property_definition(StreamsDefinitions.stream)

  @stream_groups = [
    {
      query: 'internalKey',
      property_name: 'internalKey',
      schema: {
        internalKey: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]

  @rand_stream_groups = GraphqlHelpers.property_definition(StreamsDefinitions.stream_groups)

  @stream_group = [
    {
      query: 'internalKey',
      property_name: 'internalKey',
      schema: {
        internalKey: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'description',
      property_name: 'description',
      schema: {
        description: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'streams { ' + GraphqlHelpers.filtered_definitions(@stream, :query).join(' ') + ' }',
      property_name: 'streams',
      schema: {
        streams: {
          oneOf: [
            {
              type: 'array',
              items: {
                type: 'object',
                required: GraphqlHelpers.filtered_definitions(@stream, :property_name),
                properties:
                  GraphqlHelpers.filtered_definitions(@stream, :schema).reduce(&:merge)
              }
            },
            {
              type: 'null'
            }
          ]
        }
      }
    }
  ]

  @rand_stream_group = GraphqlHelpers.property_definition(StreamsDefinitions.stream_group)

end
