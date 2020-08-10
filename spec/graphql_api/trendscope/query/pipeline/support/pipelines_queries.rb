require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/query/pipeline/support/support'
require './spec/graphql_api/trendscope/definitions/pipeline_definitions'

module PipelinesQueries
  class << self
    attr_accessor :missing_required_sub_field, :invalid_page_value, :invalid_page_size_value, :invalid_field, :invalid_field_with_sub_field, :pipelines_query, :invalid_order_by_direction, :invalid_order_by_field, :invalid_search_value
  end

  ####### POSITIVE QUERIES #######

  def self.pipelines_query (definition)
    { query:
      '{
        pipelines {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
            }
          totalCount
        }
      }'
    }.to_json
  end

  def self.pipelines_with_args (definition, args)
    { query:
        '{
        pipelines (' + args + ') {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
          }
          pageInfo {
            page
            pages
            pageSize
          }
        }
      }'
    }.to_json
  end

  def self.pipelines_with_filter (args)
    { query:
        '{
        pipelines (filter: "' + args + '") {
          nodes {
            ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
          }
          pageInfo {
            page
            pages
            pageSize
          }
        }
      }'
    }.to_json
  end

  ####### NEGATIVE QUERIES #######

  @missing_required_sub_field =
    {
      query: '{
        pipelines {
          nodes{
            steps
          }
        }
      }'
    }.to_json

  @invalid_search_value =
    {
      query: '{
        pipelines (search: 1) {
          nodes{
            id
          }
        }
      }'
    }.to_json

  @invalid_page_value =
    {
      query: '{
        pipelines(page: "invalid") {
          nodes{
            id
          }
        }
      }'
    }.to_json
  
  @invalid_page_size_value =
    {
      query: '{
        pipelines(pageSize: "invalid") {
          nodes{
            id
          }
        }
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        pipelines {
          nodes{
            invalid
            wrong
            superWrong
            megaWrong
          }
        }
      }'
    }.to_json

  @invalid_field_with_sub_field =
    {
      query: '{
        pipelines {
          nodes {
            id {
              id
            }
          }
        }
      }'
    }.to_json

  @invalid_order_by_direction =
    {
      query: '{
        pipelines(orderBy: {field: CREATED_DATE, direction: DOWN}) {
          nodes {
            createdDate
          }
        }
      }'
    }.to_json

  @invalid_order_by_field =
    {
      query: '{
        pipelines(orderBy: {field: INVALID, direction: ASC}) {
          nodes {
            createdDate
          }
        }
      }'
    }.to_json

end