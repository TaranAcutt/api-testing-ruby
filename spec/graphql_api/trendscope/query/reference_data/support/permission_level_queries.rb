require './spec/graphql_api/trendscope/query/reference_data/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module PermissionLevelQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field
  end

  def self.permission_level_query (definitions)
    { query:
        '{
        referenceData  {
          permissionLevels {
            ' + GraphqlHelpers.filtered_definitions(definitions, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  @invalid_field =
    {
      query: '{
        referenceData {
          permissionLevels {
            invalid
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        referenceData {
          permissionLevels {
            level {
              id
            }
          }
        }
      }'
    }.to_json

end