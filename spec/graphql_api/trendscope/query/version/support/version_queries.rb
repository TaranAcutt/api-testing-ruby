require './spec/graphql_api/trendscope/definitions/user_definitions'

module VersionQueries
  class << self
    attr_accessor :version_query, :invalid_sub_field_query
  end

  @version_query =
    {
      query: '{
        version
      }'
    }.to_json

  @invalid_sub_field_query =
    {
      query: '{
         version {
          id
        }
      }'
    }.to_json
end
