require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssociationCountsQueries
  class << self
    attr_accessor :invalid_argument_syntax, :missing_required_argument, :invalid_field
  end
  
  def self.pipelines_runs_association_counts(definition)
    {
      query: '{
        pipelines (pageSize: 20, filter: "status==COMPLETE") {
          nodes {
            runs {
              nodes {
                association {
                  associationCounts(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]]) {
                    ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
  
  @missing_required_argument =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                association {
                  associationCounts(market: "Global", category: "Brands & Products", lens: "Brands") {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.associated, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                association {
                  associationCounts(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]]) {
                    invalid
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  
  def self.invalid_filter
    {
      query: '{
        pipeline (id: "' + GraphqlDataService.reports_pipelines[0]['pipeline']['id'] + '") {
          runs {
            nodes {
              association {
                associationCounts(market: "Global", category: "Brands & Products", lens: "Brands", "(INVALID)" ) {
                  ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.associated, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
end