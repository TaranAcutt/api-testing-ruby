require './spec/graphql_api/trendscope/query/demographics_metric/support/demographics_metrics_queries'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/demographics_metric_definitions'
require './spec/graphql_api/trendscope/query/demographics_metric/support/demographics_metrics_schema'

describe 'demographics_metrics' do
  context 'positive tests' do
    context 'metrics via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_runs_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)) }
        
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
          expect(response).to match_schema(DemographicMetricSupport.pipelines_runs_demographics_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(DemographicsMetricDefinitions.rand_demographic_metrics, :property_name).join(', ') do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_runs_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)) }
          
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
            expect(response).to match_schema(DemographicMetricSupport.pipelines_runs_demographics_metrics_rand)
          end
        end
      end
      
      context 'page' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_runs_demographics_with_args(data[:property_name], 'page:2')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page in pageInfo' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                pipelines['runs']['nodes'].each do |runs|
                  expect(runs['demographic'][data[:property_name]]['pageInfo']['page']).to eq 2
                end
              end
            end
          end
        end
      end
      
      context 'page_size' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_runs_demographics_with_args(data[:property_name], 'pageSize:5')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                pipelines['runs']['nodes'].each do |runs|
                  expect(runs['demographic'][data[:property_name]]['nodes'].count).to be <= 5
                end
              end
            end
            it 'returns expected page_size in pageInfo' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                pipelines['runs']['nodes'].each do |runs|
                  expect(runs['demographic'][data[:property_name]]['pageInfo']['pageSize']).to eq 5
                end
              end
            end
          end
        end
      end
      
      context 'total_count' do
        DemographicsMetricDefinitions.demographics_metrics.each do |val|
          context val[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_runs_demographics_with_args(val[:property_name], 'page: 1')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              JsonPath.on(response[:json], '$...["' + val[:property_name] + '"]').each do |data|
                expect(data['totalCount']).to be >= data['nodes'].count
              end
            end
          end
        end
      end
      
      context 'orderBy' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            %w[ASC DESC].each do |direction|
              context 'direction - ' + direction do
                %w[ESTIMATED_SIZE ACTUAL_SIZE PERCENTAGE].each do |field|
                  context 'field - ' + field do
                    let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_runs_demographics_with_args(data[:property_name], "orderBy: {field: #{field}, direction: #{direction}}")) }
                    
                    it 'returns 200 status code' do
                      expect(response).to return_expected_status_code(200)
                    end
                    it 'returns expected content_type' do
                      expect(response).to return_expected_content_type
                    end
                    it 'returns a response without errors' do
                      expect(response).to return_response_without_errors
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    
    context 'metric via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)) }
        
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
          expect(response).to match_schema(DemographicMetricSupport.pipelines_run_demographics_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(DemographicsMetricDefinitions.rand_demographic_metrics, :property_name).join(', ') do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)) }
          
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
            expect(response).to match_schema(DemographicMetricSupport.pipelines_run_demographics_metrics_rand)
          end
        end
      end
      
      context 'page' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_run_demographics_with_args(data[:property_name], 'page:2')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page in pageInfo' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                next if pipelines['run'].nil? || pipelines.empty?
                expect(pipelines['run']['demographic'][data[:property_name]]['pageInfo']['page']).to eq 2
              end
            end
          end
        end
      end
      
      context 'page_size' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_run_demographics_with_args(data[:property_name], 'pageSize:5')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                next if pipelines['run'].nil? || pipelines.empty?
                expect(pipelines['run']['demographic'][data[:property_name]]['nodes'].count).to be <= 5
              end
            end
            it 'returns expected page_size in pageInfo' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                next if pipelines['run'].nil? || pipelines.empty?
                expect(pipelines['run']['demographic'][data[:property_name]]['pageInfo']['pageSize']).to eq 5
              end
            end
          end
        end
      end
    end
    
    context 'metric via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_last_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)) }
        
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
          expect(response).to match_schema(DemographicMetricSupport.pipelines_last_run_demographics_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(DemographicsMetricDefinitions.rand_demographic_metrics, :property_name).join(', ') do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_last_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)) }
          
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
            expect(response).to match_schema(DemographicMetricSupport.pipelines_last_run_demographics_metrics_rand)
          end
        end
      end
      
      context 'page' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_last_run_demographics_with_args(data[:property_name], 'page:2')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page in pageInfo' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                next if pipelines['lastRun'].nil? || pipelines.empty?
                expect(pipelines['lastRun']['demographic'][data[:property_name]]['pageInfo']['page']).to eq 2
              end
            end
          end
        end
      end
      
      context 'page_size' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipelines_last_run_demographics_with_args(data[:property_name], 'pageSize:5')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                next if pipelines['lastRun'].nil? || pipelines.empty?
                expect(pipelines['lastRun']['demographic'][data[:property_name]]['nodes'].count).to be <= 5
              end
            end
            it 'returns expected page_size in pageInfo' do
              response[:json]['data']['pipelines']['nodes'].each do |pipelines|
                next if pipelines['lastRun'].nil? || pipelines.empty?
                expect(pipelines['lastRun']['demographic'][data[:property_name]]['pageInfo']['pageSize']).to eq 5
              end
            end
          end
        end
      end
    end
    
    context 'metric via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_runs_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)) }
        
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
          expect(response).to match_schema(DemographicMetricSupport.pipeline_runs_demographics_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(DemographicsMetricDefinitions.rand_demographic_metrics, :property_name).join(', ') do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_runs_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)) }
          
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
            expect(response).to match_schema(DemographicMetricSupport.pipeline_runs_demographics_metrics_rand)
          end
        end
      end
      
      context 'page' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_runs_demographics_with_args(data[:property_name], 'page:2')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page in pageInfo' do
              response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
                next if runs.empty?
                expect(runs['demographic'][data[:property_name]]['pageInfo']['page']).to eq 2
              end
            end
          end
        end
      end
      
      context 'page_size' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_runs_demographics_with_args(data[:property_name], 'pageSize:5')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
                next if runs.empty?
                expect(runs['demographic'][data[:property_name]]['nodes'].count).to be <= 5
              end
            end
            it 'returns expected page_size in pageInfo' do
              response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
                next if runs.empty?
                expect(runs['demographic'][data[:property_name]]['pageInfo']['pageSize']).to eq 5
              end
            end
          end
        end
      end
    end
    
    context 'metric via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)) }
        
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
          expect(response).to match_schema(DemographicMetricSupport.pipeline_run_demographics_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(DemographicsMetricDefinitions.rand_demographic_metrics, :property_name).join(', ') do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)) }
          
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
            expect(response).to match_schema(DemographicMetricSupport.pipeline_run_demographics_metrics_rand)
          end
        end
      end
      
      context 'page' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_run_demographics_with_args(data[:property_name], 'page:2')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page in pageInfo' do
              next if response[:json]['data']['pipeline']['run'].nil? || response[:json]['data']['pipeline']['run'].empty?
              expect(response[:json]['data']['pipeline']['run']['demographic'][data[:property_name]]['pageInfo']['page']).to eq 2
            end
          end
        end
      end
      
      context 'page_size' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_run_demographics_with_args(data[:property_name], 'pageSize:5')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              next if response[:json]['data']['pipeline']['run'].nil? || response[:json]['data']['pipeline']['run'].empty?
              expect(response[:json]['data']['pipeline']['run']['demographic'][data[:property_name]]['nodes'].count).to be <= 5
            end
            it 'returns expected page_size in pageInfo' do
              next if response[:json]['data']['pipeline']['run'].nil? || response[:json]['data']['pipeline']['run'].empty?
              expect(response[:json]['data']['pipeline']['run']['demographic'][data[:property_name]]['pageInfo']['pageSize']).to eq 5
            end
          end
        end
      end
    end
    
    context 'metric via pipeline > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_last_run_demographics_metrics(DemographicsMetricDefinitions.demographics_metrics)) }
        
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
          expect(response).to match_schema(DemographicMetricSupport.pipeline_last_run_demographics_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(DemographicsMetricDefinitions.rand_demographic_metrics, :property_name).join(', ') do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_last_run_demographics_metrics(DemographicsMetricDefinitions.rand_demographic_metrics)) }
          
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
            expect(response).to match_schema(DemographicMetricSupport.pipeline_last_run_demographics_metrics_rand)
          end
        end
      end
      
      context 'page' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_last_run_demographics_with_args(data[:property_name], 'page:2')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page in pageInfo' do
              next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
              expect(response[:json]['data']['pipeline']['lastRun']['demographic'][data[:property_name]]['pageInfo']['page']).to eq 2
            end
          end
        end
      end
      
      context 'page_size' do
        DemographicsMetricDefinitions.demographics_metrics.each do |data|
          context data[:property_name] do
            let(:response) { Requests.graphql(DemographicsMetricsQueries.pipeline_last_run_demographics_with_args(data[:property_name], 'pageSize:5')) }
            
            it 'returns 200 status code' do
              expect(response).to return_expected_status_code(200)
            end
            it 'returns expected content_type' do
              expect(response).to return_expected_content_type
            end
            it 'returns a response without errors' do
              expect(response).to return_response_without_errors
            end
            it 'returns expected page_size in response' do
              next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
              expect(response[:json]['data']['pipeline']['lastRun']['demographic'][data[:property_name]]['nodes'].count).to be <= 5
            end
            it 'returns expected page_size in pageInfo' do
              next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
              expect(response[:json]['data']['pipeline']['lastRun']['demographic'][data[:property_name]]['pageInfo']['pageSize']).to eq 5
            end
          end
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(DemographicsMetricsQueries.invalid_field) }
      
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
    
    context 'invalid argument type' do
      let(:response) { Requests.graphql(DemographicsMetricsQueries.invalid_argument_type) }
      
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
    
    context 'missing required sub field' do
      GraphqlHelpers.schema_by_type('DemographicsMetrics')['fields'].collect { |x| x['name'] }.each do |field|
        context field do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.missing_required_sub_field(field)) }
          
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
    
    context 'missing required argument' do
      let(:response) { Requests.graphql(DemographicsMetricsQueries.missing_required_argument) }
      
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
    
    context 'invalid order_by direction' do
      let(:response) { Requests.graphql(DemographicsMetricsQueries.invalid_order_by_direction) }
      
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
    
    context 'invalid order_by field' do
      let(:response) { Requests.graphql(DemographicsMetricsQueries.invalid_order_by_field) }
      
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
    
    context 'sub field on invalid field' do
      GraphqlHelpers.schema_by_type('DemographicsMetrics')['fields'].collect { |x| x['name'] }.each do |field|
        context field do
          let(:response) { Requests.graphql(DemographicsMetricsQueries.sub_field_on_invalid_field(field)) }
          
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
  end
end
