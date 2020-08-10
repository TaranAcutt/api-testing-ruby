require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/query/pipeline_step/support/support'
require './spec/graphql_api/trendscope/definitions/step_definitions'

module PipelinesStepsQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_first_value, :invalid_field, :invalid_field_with_sub_field, :edges_and_nodes_in_query
  end

  def self.steps_query (definition)
    {
      query: '{
      pipelines {
        nodes{
          steps {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }
    }'
    }.to_json
  end

  def self.step_by_type_query (definition, type)
    {
      query: '{
      pipelines {
        nodes{
          steps(type: "' + type + '") {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
        }
      }
    }'
    }.to_json
  end

  def self.missing_required_sub_field
    {
      query: '{
        pipelines {
          nodes {
            steps {
              outputs
            }
          }
        }
      }'
    }.to_json
  end

  def self.invalid_argument_type
    {
      query: '{
        pipelines {
          nodes {
            steps(type: 1234) {
              id
            }
          }
        }
      }'
    }.to_json
  end

  def self.invalid_field
    {
      query: '{
        pipelines {
          nodes {
            steps {
              invalid
            }
          }
        }
      }'
    }.to_json
  end

  def self.sub_field_on_invalid_field
    {
      query: '{
        pipelines {
          nodes {
            steps {
              id {
                id
              }
            }
          }
        }
      }'
    }.to_json
  end
end