require './spec/graphql_api/trendscope/definitions/streams_definitions'
require './spec/graphql_api/trendscope/query/stream_groups/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamGroupsQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field, :invalid_internal_key_type
  end

  def self.stream_groups_query (definitions)
    { query:
        '{
        streamGroups {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(definitions ,:query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.stream_groups_with_args_query (definitions, args)
    {
      query: '{
        streamGroups (' + args + ') {
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
        streamGroups {
          nodes {
            invalid
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        streamGroups {
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
        streamGroups (internalKeyIn: [INVALID]) {
          nodes {
            internalKey
          }
        }
      }'
    }.to_json

end