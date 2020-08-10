require './spec/graphql_api/trendscope/definitions/streams_definitions'
require './spec/graphql_api/trendscope/query/streams/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamsQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field, :invalid_internal_key_type
  end

  def self.streams_query (definitions)
    { query:
      '{
        streams {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(definitions ,:query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.streams_with_args_query (definitions, args)
    {
      query: '{
        streams (' + args + ') {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(definitions ,:query).join(' ') + '
          }
          pageInfo {
            page
            pages
            pageSize
          }
        }
      }'
    }.to_json
  end
  
  @invalid_field =
    {
      query: '{
        streams {
          nodes {
            invalid
          }
        }
      }'
    }.to_json
  
  @invalid_field_with_sub_field =
    {
      query: '{
        streams {
          nodes {
            internalKey {
              id
            }
          }
        }
      }'
    }.to_json

  @invalid_internal_key_type =
    {
      query: '{
        streams (internalKeyIn: [INVALID]) {
          nodes {
            internalKey
          }
        }
      }'
    }.to_json

end