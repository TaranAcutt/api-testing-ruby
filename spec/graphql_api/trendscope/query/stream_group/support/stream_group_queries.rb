require './spec/graphql_api/trendscope/definitions/streams_definitions'
require './spec/graphql_api/trendscope/query/stream_group/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module StreamGroupQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field, :invalid_internal_key_type
  end

  def self.stream_group_query (definitions)
    {
      query: '{
        streamGroup (internalKey: "' + GraphqlDataService.stream_group_internal_key + '") {
          ' + GraphqlHelpers.filtered_definitions(definitions, :query).join(' ') + '
        }
      }'
    }.to_json
  end

  @invalid_field =
    {
      query: '{
        streamGroup (internalKey: "' + GraphqlDataService.stream_group_internal_key + '") {
          invalid
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        streamGroup (internalKey: "' + GraphqlDataService.stream_group_internal_key + '") {
          internalKey {
            id
          }
        }
      }'
    }.to_json

  @invalid_internal_key_type =
    {
      query: '{
        streamGroups (internalKey: INVALID) {
          internalKey
        }
      }'
    }.to_json

end