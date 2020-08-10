require './spec/graphql_api/trendscope/query/reference_data/support/support'
require './spec/graphql_api/trendscope/definitions/data_qa_metrics_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module QaDemographicsQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field, :field_missing_sub_field, :invalid_pipeline_id
  end
  
  def self.qa_demographics_query
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "' + GraphqlDataService.pipeline_id + '") {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_demographics, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  def self.rand_qa_demographics_query
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "' + GraphqlDataService.pipeline_id + '") {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.rand_qa_demographics, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  def self.qa_demographics_max_tpv_ranking_query
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "' + GraphqlDataService.pipeline_id + '", maxTpvRank: 50) {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_demographics, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  @invalid_pipeline_id =
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "INVALID") {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_demographics, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  
  @field_missing_sub_field =
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "' + GraphqlDataService.pipeline_id + '") {
            subLenses
          }
        }
      }'
    }.to_json
  
  
  @invalid_field =
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "' + GraphqlDataService.pipeline_id + '") {
            invalid
          }
        }
      }'
    }.to_json
  
  @invalid_field_with_sub_field =
    { query:
      '{
        dataQAMetrics  {
          qaDemographics (id: "' + GraphqlDataService.pipeline_id + '") {
            subLenses {
              INVALID
            }
          }
        }
      }'
    }.to_json

end