require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'

module PermissionsQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_page_size_value, :invalid_field, :invalid_field_with_sub_field, :invalid_order_by_field, :invalid_order_by_direction
  end


  def self.pipeline_permissions_query(definition)
    {
      query: '{
        pipelines ( pageSize: 100 ) {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.reports_permissions_query(definition)
    {
      query: '{
        reports {
          tpvReports ( pageSize: 100 ) {
            nodes {
               ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
          }
        }
      }'
    }.to_json
  end


  def self.pipeline_permissions_by_id_query(pipelines, pipeline_name, definition)
    {
      query: '{
        pipeline (id: "' + GraphqlHelpers.pipeline_by_name(pipelines, pipeline_name) + '") {
          ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
        }
      }'
    }.to_json
  end

  def self.reports_permissions_by_id_query(reports, tpv_report_name, definition)
    {
      query: '{
        reports {
          tpvReport (id: "' + GraphqlHelpers.report_by_name(reports, tpv_report_name) + '") {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
end