require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'
require './spec/graphql_api/trendscope/query/reports/support/support'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module TpvReportsQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_page_size_value, :invalid_field, :invalid_field_with_sub_field, :invalid_order_by_direction, :invalid_order_by_field
  end

  def self.pipelines_tpv_reports (definition)
    {
      query: '{
        pipelines {
          nodes {
            reports {
              tpvReports {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
                totalCount
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_tpv_reports_with_args (args)
    {
      query: '{
        pipelines {
          nodes {
            reports {
              tpvReports (' + args + ') {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.tpv_report, :query).join(' ') + '
                }
                pageInfo {
                  page
                  pages
                  pageSize
                }
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_tpv_reports (definition)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          reports {
            tpvReports {
              nodes {
                ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_tpv_reports_with_args (args)
    {
      query: '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          reports {
            tpvReports (' + args + ') {
              nodes {
                ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.tpv_report, :query).join(' ') + '
              }
              pageInfo {
                page
                pages
                pageSize
              }
            }
          }
        }
      }'
    }.to_json
  end

  def self.reports_tpv_reports (definition)
    {
      query: '{
        reports {
          tpvReports {
            nodes {
              ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
          }
        }
      }'
    }.to_json
  end

  def self.reports_tpv_reports_with_args (args)
    {
      query: '{
        reports {
          tpvReports (' + args + ') {
            nodes {
              ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.tpv_report, :query).join(' ') + '
            }
            pageInfo {
              page
              pages
              pageSize
            }
          }
        }
      }'
    }.to_json
  end

  def self.reports_tpv_reports_with_filter (args)
    {
      query: '{
        reports {
          tpvReports (filter: "' + args + '") {
            nodes {
              ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.tpv_report, :query).join(' ') + '
            }
            pageInfo {
              page
              pages
              pageSize
            }
          }
        }
      }'
    }.to_json
  end

  @missing_required_sub_field =
    {
      query: '{
        reports {
          tpvReports {
            nodes {
              phases
            }
          }
        }
      }'
    }.to_json

  @invalid_page_size_value =
    {
      query: '{
        reports {
          tpvReports(pageSize: invalid){
            nodes{
              id
            }
          }
        }
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        reports {
          tpvReports {
            nodes {
              invalid
              wrong
              superWrong
              megaWrong
            }
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        pipeline {
          nodes {
            runs {
              nodes {
                id {
                  id
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_order_by_direction =
    {
      query: '{
        pipelines {
          nodes {
            reports {
              tpvReports (orderBy: { field: CREATED_DATE, direction: DOWN }) {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.tpv_report, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_order_by_field =
    {
      query: '{
        pipelines {
          nodes {
            reports {
              tpvReports (orderBy: { field: INVALID, direction: ASC }) {
                nodes {
                  ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.tpv_report, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json


end