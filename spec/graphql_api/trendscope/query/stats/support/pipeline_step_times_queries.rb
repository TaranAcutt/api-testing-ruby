require './spec/graphql_api/trendscope/query/reports/support/support'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module PipelineStepTimesQueries
  class << self
    attr_accessor :invalid_field, :invalid_subfield_on_field
  end
  
  def self.pipeline_step_times_no_filter (definition)
    {
      query: '{
        stats {
          pipelineStepTimes {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }'
    }.to_json
  end
  
  def self.pipeline_step_times_with_filter (definition)
    {
      query: '{
        stats {
          pipelineStepTimes (fromDate: "2019-01-01" toDate: "2019-03-07") {
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
          pipelineStepTimes {
            invalid
          }
        }
      }'
  }.to_json

  @invalid_subfield_on_field = {
    query:
      '{
        stats {
          pipelineStepTimes {
            type {
              id
            }
          }
        }
      }'
  }.to_json
end