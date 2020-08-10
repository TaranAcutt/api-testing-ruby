require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module TpvReportQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_id_value, :invalid_field, :invalid_field_with_sub_field, :edges_and_nodes_in_query, :invalid_pipeline_argument
  end

  def self.reports_tpv_report (definition)
    {
      query: '{
        reports {
          tpvReport(id: "' + GraphqlDataService.report_id + '") {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  @missing_required_sub_field =
    {
      query: '{
        reports {
          tpvReport(id: "' + GraphqlDataService.report_id + '") {
            pipeline
          }
        }
      }'
    }.to_json

  @invalid_id_value =
    {
      query: '{
        reports {
          tpvReport(id: kfgjlkfjg) {
            id
          }
        }
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        reports {
          tpvReport(id: "' + GraphqlDataService.report_id + '") {
            wrong
            reallywrong
            megawrong
            ultrawrong
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        reports {
          tpvReport(id: "' + GraphqlDataService.report_id + '") {
            id {
              id
            }
          }
        }
      }'
    }.to_json

end