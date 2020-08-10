require './spec/graphql_api/trendscope/query/tpv_metric/support/tpv_overview_queries'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'
require './spec/graphql_api/trendscope/query/tpv_metric/support/support'

describe 'tpv_overview' do
  context 'positive tests' do
    context 'overview via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_runs_tpv_overview(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_overview_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_overview, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_runs_tpv_overview(TpvMetricDefinitions.rand_overview)) }
          
          it 'returns 200 status code' do
            expect(response).to return_expected_status_code(200)
          end
          it 'returns expected content_type' do
            expect(response).to return_expected_content_type
          end
          it 'returns a response without errors' do
            expect(response).to return_response_without_errors
          end
          it 'response conforms to local schema' do
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_overview_schema_rand)
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_runs_tpv_overview_search(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_overview_schema_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["overview"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'overview via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_run_tpv_overview(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_overview_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_overview, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_run_tpv_overview(TpvMetricDefinitions.rand_overview)) }
          
          it 'returns 200 status code' do
            expect(response).to return_expected_status_code(200)
          end
          it 'returns expected content_type' do
            expect(response).to return_expected_content_type
          end
          it 'returns a response without errors' do
            expect(response).to return_response_without_errors
          end
          it 'response conforms to local schema' do
            expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_overview_schema_rand)
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_run_tpv_overview_search(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_overview_schema_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["overview"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'overview via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_last_run_tpv_overview(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_overview_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_overview, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_last_run_tpv_overview(TpvMetricDefinitions.rand_overview)) }
          
          it 'returns 200 status code' do
            expect(response).to return_expected_status_code(200)
          end
          it 'returns expected content_type' do
            expect(response).to return_expected_content_type
          end
          it 'returns a response without errors' do
            expect(response).to return_response_without_errors
          end
          it 'response conforms to local schema' do
            expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_overview_schema_rand)
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipelines_last_run_tpv_overview_search(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_overview_schema_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["overview"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'overview via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_runs_tpv_overview(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_overview_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_overview, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_runs_tpv_overview(TpvMetricDefinitions.rand_overview)) }
          
          it 'returns 200 status code' do
            expect(response).to return_expected_status_code(200)
          end
          it 'returns expected content_type' do
            expect(response).to return_expected_content_type
          end
          it 'returns a response without errors' do
            expect(response).to return_response_without_errors
          end
          it 'response conforms to local schema' do
            expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_overview_schema_rand)
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_runs_tpv_overview_search(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_overview_schema_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["overview"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'overview via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_run_tpv_overview(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_overview_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_overview, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_run_tpv_overview(TpvMetricDefinitions.rand_overview)) }
          
          it 'returns 200 status code' do
            expect(response).to return_expected_status_code(200)
          end
          it 'returns expected content_type' do
            expect(response).to return_expected_content_type
          end
          it 'returns a response without errors' do
            expect(response).to return_response_without_errors
          end
          it 'response conforms to local schema' do
            expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_overview_schema_rand)
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_run_tpv_overview_search(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_overview_schema_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["overview"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'overview via pipeline > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_last_run_tpv_overview(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_overview_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_overview, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_last_run_tpv_overview(TpvMetricDefinitions.rand_overview)) }
          
          it 'returns 200 status code' do
            expect(response).to return_expected_status_code(200)
          end
          it 'returns expected content_type' do
            expect(response).to return_expected_content_type
          end
          it 'returns a response without errors' do
            expect(response).to return_response_without_errors
          end
          it 'response conforms to local schema' do
            expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_overview_schema_rand)
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvOverviewQueries.pipeline_last_run_tpv_overview_search(TpvMetricDefinitions.overview)) }
        
        it 'returns 200 status code' do
          expect(response).to return_expected_status_code(200)
        end
        it 'returns expected content_type' do
          expect(response).to return_expected_content_type
        end
        it 'returns a response without errors' do
          expect(response).to return_response_without_errors
        end
        it 'response conforms to local schema' do
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_overview_schema_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["overview"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvOverviewQueries.invalid_field) }
      
      it 'returns 400 status code' do
        expect(response).to return_expected_status_code(400)
      end
      it 'returns expected content_type' do
        expect(response).to return_expected_content_type
      end
      it 'response conforms to error schema' do
        expect(response).to match_graphql_error_schema
      end
    end
    
    context 'invalid search value' do
      let(:response) { Requests.graphql(TpvOverviewQueries.invalid_search_value(TpvMetricDefinitions.overview)) }
      
      it 'returns 400 status code' do
        expect(response).to return_expected_status_code(400)
      end
      it 'returns expected content_type' do
        expect(response).to return_expected_content_type
      end
      it 'response conforms to error schema' do
        expect(response).to match_graphql_error_schema
      end
    end
    
    context 'missing search value' do
      let(:response) { Requests.graphql(TpvOverviewQueries.missing_search_value(TpvMetricDefinitions.overview)) }
      
      it 'returns 400 status code' do
        expect(response).to return_expected_status_code(400)
      end
      it 'returns expected content_type' do
        expect(response).to return_expected_content_type
      end
      it 'response conforms to error schema' do
        expect(response).to match_graphql_error_schema
      end
    end
    
    context 'invalid field with sub field' do
      let(:response) { Requests.graphql(TpvOverviewQueries.invalid_field_with_sub_field) }
      
      it 'returns 400 status code' do
        expect(response).to return_expected_status_code(400)
      end
      it 'returns expected content_type' do
        expect(response).to return_expected_content_type
      end
      it 'response conforms to error schema' do
        expect(response).to match_graphql_error_schema
      end
    end
  end
end



