require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'
require './spec/graphql_api/trendscope/query/pipeline_run/support/support'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module PipelineRunsQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_first_value, :invalid_field, :invalid_field_with_sub_field, :invalid_order_by_field, :invalid_order_by_direction
  end

  def self.pipelines_runs_query (definition)
    { query:
      '{
        pipelines {
          nodes {
            runs {
              nodes {
                ' + GraphqlHelpers.filtered_definitions(definition ,:query).join(' ') + '
              }
              totalCount
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_runs_with_args (args)
    { query:
      '{
        pipelines {
          nodes {
            runs (' + args + ') {
              nodes {
                ' + GraphqlHelpers.filtered_definitions(PipelineRunDefinitions.pipeline_run ,:query).join(' ') + '
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

  def self.pipeline_runs_query (definition)
    { query:
        '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs {
            nodes {
              ' + GraphqlHelpers.filtered_definitions(definition ,:query).join(' ') + '
            }
          }
        }
      }'
    }.to_json
  end

  def self.pipeline_runs_query_with_args (args)
    { query:
        '{
        pipeline(id: "' + GraphqlDataService.pipeline_id + '") {
          runs (' + args + '){
            nodes {
              ' + GraphqlHelpers.filtered_definitions(PipelineRunDefinitions.pipeline_run ,:query).join(' ') + '
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

  ###### NEGATIVE QUERIES ######

  @missing_required_sub_field =
    {
      query: '{
        pipeline {
          nodes {
            runs {
              nodes {
                id
                tpv
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_first_value =
    {
      query: '{
        pipeline {
          nodes{
            runs(first: invalid) {
              nodes {
                id
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        pipeline {
          nodes {
            runs {
              nodes {
                invalid
                wrong
                superWrong
                megaWrong
              }
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
            runs (orderBy: {field: CREATED_DATETIME, direction: DOWN}) {
              nodes {
                createdDate
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
            runs (orderBy: {field: INVALID, direction: ASC}) {
              nodes {
                createdDate
              }
            }
          }
        }
      }'
    }.to_json

end