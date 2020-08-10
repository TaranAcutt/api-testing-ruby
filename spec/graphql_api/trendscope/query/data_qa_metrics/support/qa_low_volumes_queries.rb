require './spec/graphql_api/trendscope/query/reference_data/support/support'
require './spec/graphql_api/trendscope/definitions/data_qa_metrics_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'

module QaLowVolumesQueries
  class << self
    attr_accessor :invalid_field, :invalid_field_with_sub_field, :field_missing_sub_field, :invalid_pipeline_id
  end
  
  def self.qa_low_volumes_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '") {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  def self.rand_qa_low_volumes_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '") {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.rand_qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  def self.qa_low_volumes_max_tpv_ranking_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '", maxTpvRank: 50) {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.qa_low_volumes_max_volume_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '", maxVolume: 50) {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.qa_low_volumes_min_volume_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '", minVolume: 50) {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.qa_low_volumes_min_max_volume_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '", minVolume: 50, maxVolume: 100) {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end

  def self.qa_low_volumes_all_filters_query
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '", minVolume: 50, maxVolume: 100, maxTpvRank: 50) {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  @invalid_pipeline_id =
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "INVALID") {
            ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.qa_low_volumes, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  
  @field_missing_sub_field =
    { query:
      '{
        dataQAMetrics  {
          qaLowVolumes (id: "' + GraphqlDataService.pipeline_id + '") {
            subLenses
          }
        }
      }'
    }.to_json
  
  
  @invalid_field =
    {
      query: '{
        dataQAMetrics {
          qaLowVolumes {
            invalid
          }
        }
      }'
    }.to_json
  
  @invalid_field_with_sub_field =
    {
      query: '{
        dataQAMetrics {
          qaLowVolumes {
            subLenses {
              id
            }
          }
        }
      }'
    }.to_json

end