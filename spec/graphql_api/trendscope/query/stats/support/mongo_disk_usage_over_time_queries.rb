require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/stats_definitions'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module MongoDiskUsageOverTimeQueries
  class << self
    attr_accessor :invalid_field, :missing_required_arguments, :invalid_date_value, :invalid_date_type, :invalid_sub_field
  end
  
  def self.mongo_disk_usage_over_time_query (definition)
    {
      query: '{
        stats {
          mongoDiskUsageOverTime (fromDate: "2019-03-01", toDate: "2019-03-05") {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  @invalid_field = {
    query:
      '{
        stats {
          mongoDiskUsageOverTime (fromDate: "2019-03-01", toDate: "2019-03-05") {
            invalid
          }
        }
      }'
  }.to_json
  
  @missing_required_arguments = {
    query:
      '{
        stats {
          mongoDiskUsageOverTime {
            invalid
          }
        }
      }'
  }.to_json
  
  @invalid_date_value = {
    query:
      '{
        stats {
          mongoDiskUsageOverTime (fromDate: "2019-03-01", toDate: "invalid") {
            ' + GraphqlHelpers.filtered_definitions(StatsDefinitions.mongo_disk_space, :query).join(' ') + '
          }
        }
      }
    }'
  }.to_json
  
  @invalid_date_type = {
    query:
      '{
        stats {
          mongoDiskUsageOverTime (fromDate: 2, toDate: 3) {
            total
          }
        }
      }'
  }.to_json
  
  @invalid_sub_field = {
    query:
      '{
        stats {
          mongoDiskUsageOverTime (fromDate: "2019-03-01", toDate: "2019-03-05") {
            total {
              id
            }
          }
        }
      }'
  }.to_json
end