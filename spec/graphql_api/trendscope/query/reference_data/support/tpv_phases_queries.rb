require './spec/graphql_api/trendscope/query/reference_data/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module TpvPhasesQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field
  end

  def self.tpv_phases_query (definitions)
    { query:
        '{
        referenceData  {
          tpvPhases {
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
          tpvPhases {
            invalid
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        referenceData {
          tpvPhases {
            id {
              id
            }
          }
        }
      }'
    }.to_json

end