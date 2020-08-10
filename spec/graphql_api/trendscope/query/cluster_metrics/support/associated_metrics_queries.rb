require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssociatedMetricsQueries
  class << self
    attr_accessor :invalid_argument_syntax, :missing_required_argument, :invalid_field_with_sub_field, :invalid_order_by_field,
                  :invalid_order_by_direction, :invalid_sub_field, :invalid_field
  end
  
  def self.pipeline_runs_associated_metrics (definition)
    {
      query: '{
        pipeline (id: "' + GraphqlDataService.reports_pipelines[0]['pipeline']['id'] + '") {
          runs {
            nodes {
              association {
                associatedMetrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]]) {
                  ' + GraphqlHelpers.filtered_definitions(definition, :query).join(' ') + '
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
  
  def self.association_with_strength
    {
      query: '{
        pipelines (pageSize: 20, filter: "status==COMPLETE") {
          nodes {
            runs {
              nodes {
                association {
                  associatedMetrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]], associationStrengthRanges:[{start:0,end:1}] ) {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.associated, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
  
  def self.association_query_type(query_type)
    {
      query: '{
        pipelines (pageSize: 20, filter: "status==COMPLETE") {
          nodes {
            runs {
              nodes {
                association {
                  associatedMetrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]], , associationQueryType: ' + query_type + ' ) {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.associated, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  end
  
  @invalid_argument_syntax =
    {
      query: '{
        pipelines {
          nodes {
            runs {
              nodes {
                association {
                  associatedMetrics(market: 1, category: "Global", lens: "Brands"(association.category==\"Snacking\"&&(association.lens==\"Bakery\"||association.lens==\"Yoghurt\")&&association.subLens==null&&volume.totalValue>100)") {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.associated, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json
  
  @missing_required_argument =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                association {
                  associatedMetrics(market: "Global", category: "Brands & Products", lens: "Brands") {
                    ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.associated, :query).join(' ') + '
                  }
                }
              }
            }
          }
        }
      }'
    }.to_json

  @invalid_sub_field =
    {
      query: '{
        pipelines {
          nodes{
            runs {
              nodes {
                association {
                  associatedMetrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]]) {
                    subLens { invalid }
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
                  associatedMetrics(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]]) {
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
                associatedMetrics(market: "Global", category: "Brands & Products", lens: "Brands", "(INVALID)" ) {
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