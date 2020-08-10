require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssociatedQueries
  class << self
    attr_accessor :invalid_argument_syntax, :missing_required_argument, :invalid_field_with_sub_field, :invalid_order_by_field, :invalid_order_by_direction
  end
  
  def self.pipeline_runs_associated
    {
      query: '{
        pipeline (id: "' + GraphqlDataService.reports_pipelines[0]['pipeline']['id'] + '") {
          runs {
            nodes {
              association {
                associated(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]])
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
                  associated(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]], associationStrengthRanges:[{start:0,end:1}] )
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
                  associated(market: "' + GraphqlDataService.metric_args['market'] + '", category: "' + GraphqlDataService.metric_args['category'] + '", lens: "' + GraphqlDataService.metric_args['lens'] + '", associatedWith: [["' + GraphqlDataService.metric_args_by_nodes('category', 0) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 0) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 0) + '"], ["' + GraphqlDataService.metric_args_by_nodes('category', 1) + '","' + GraphqlDataService.metric_args_by_nodes('lens', 1) + '","' + GraphqlDataService.metric_args_by_nodes('subLens', 1) + '"]], , associationQueryType: ' + query_type + ' )
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
                  associated(market: 1, category: "Global", lens: "Brands"(association.category==\"Snacking\"&&(association.lens==\"Bakery\"||association.lens==\"Yoghurt\")&&association.subLens==null&&volume.totalValue>100)")
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
                  associated(market: "Global", category: "Brands & Products", lens: "Brands")
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
                associated(market: "Global", category: "Brands & Products", lens: "Brands", "(INVALID)" )
              }
            }
          }
        }
      }'
    }.to_json
  end
end