require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module MiscQueries
  class << self
    attr_accessor :fragment_query, :invalid_fragment_query
  end

  @fragment_query =
    {
      query: '{
        reports {
          tpvReport(id: "' + GraphqlDataService.report_id + '") {
            id
            slug
            name
            scalingFactor
            ...summaryPipeline
          }
        }
      }

      fragment summaryPipeline on TpvReport {
        pipeline {
          id
          name
          run(id: "' + GraphqlDataService.pipeline_run_id + '" ) {
            id
            startDate
            endDate
          }
        }
      }'
    }.to_json

  @invalid_fragment_query =
    {
      query: '{
        reports {
          tpvReport(id: "' + GraphqlDataService.report_id + '") {
            id
            slug
            name
            scalingFactor
            ...summaryPipeline
          }
        }
      }

      fragment summaryPipeline on TpvReportInvalid {
        pipeline {
          id
          name
          run(id: "' + GraphqlDataService.pipeline_run_id + '" ) {
            id
            startDate
            endDate
          }
        }
      }'
    }.to_json
end