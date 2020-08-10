require './spec/graphql_api/trendscope/query/reports/support/support'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module MongoDiskUsageQueries
  class << self
    attr_accessor :invalid_field, :invalid_subfield_on_field
  end

  def self.mongo_disk_usage_query (definition)
    {
      query: '{
        stats {
          mongoDiskUsage {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  @invalid_field =
    {
      query: '{
        stats {
          mongoDiskUsage {
            invalid
          }
        }
      }'
    }.to_json

  @invalid_subfield_on_field =
    {
      query: '{
        stats {
          mongoDiskUsage {
            total {
              id
            }
          }
        }
      }'
    }.to_json
end