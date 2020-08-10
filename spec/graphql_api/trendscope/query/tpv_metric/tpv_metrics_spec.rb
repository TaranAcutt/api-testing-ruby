require './spec/graphql_api/trendscope/query/tpv_metric/support/tpv_metrics_queries'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/query/tpv_metric/support/support'

describe 'tpv_metrics' do
  context 'positive tests' do
    context 'metrics via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_metrics(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_with_args(TpvMetricDefinitions.rand_tpv_metric, 'page:2')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_rand)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty?
            pipelines['runs']['nodes'].each do |runs|
              next if runs.empty?
              expect(runs['tpv']['metrics']['pageInfo']['page']).to eq 2
            end
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_with_args(TpvMetricDefinitions.rand_tpv_metric, 'pageSize:5')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_rand)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty?
            pipelines['runs']['nodes'].each do |runs|
              next if runs.empty?
              expect(runs['tpv']['metrics']['nodes'].count).to be <= 5
            end
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty?
            pipelines['runs']['nodes'].each do |runs|
              next if runs.empty?
              expect(runs['tpv']['metrics']['pageInfo']['pageSize']).to eq 5
            end
          end
        end
      end
      
      context 'total_count' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_rand)
        end
        it 'returns expected count for nodes' do
          JsonPath.on(response[:json], '$..["metrics"]').each do |data|
            expect(data['totalCount']).to be >= data['nodes'].count
          end
        end
      end
      
      context 'orderBy' do
        %w'ASC DESC'.each do |direction|
          context 'direction - ' + direction do
            [RANK: 'tpvRank', SUB_LENS: 'subLens', VOLUME: 'volume', POSITIVE_SENTIMENT: 'positiveSentiment', NEGATIVE_SENTIMENT: 'negativeSentiment', NEUTRAL_SENTIMENT: 'neutralSentiment', NET_SENTIMENT: 'netSentiment'].each do |values|
              values.each do |k, v|
                context 'field - ' + k.to_s do
                  let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_with_args(TpvMetricDefinitions.tpv_metric, "orderBy: {field: #{k.to_s}, direction: #{direction}}")) }
                  
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
                    expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
                  end
                  it 'returns ' + v + ' in ' + direction + ' order' do
                    JsonPath.on(response[:json], '$..["metrics"]["nodes"]').each do |data|
                      if direction == 'ASC'
                        if %w'POSITIVE_SENTIMENT NEUTRAL_SENTIMENT NEGATIVE_SENTIMENT'.include?(k.to_s)
                          expect(GraphqlHelpers.get_total_value(data, k.to_s).compact).to eq GraphqlHelpers.get_total_value(data, k.to_s).compact.sort
                        elsif %w'NET_SENTIMENT VOLUME'.include?(k.to_s)
                          expect(JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact).to eq JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact.sort
                        elsif %w'RANK SUB_LENS'.include? k.to_s
                          expect(JsonPath.on(data, '$..["' + v + '"]').compact).to eq JsonPath.on(data, '$..["' + v + '"]').compact.sort
                        end
                      elsif direction == 'DESC'
                        if %w'POSITIVE_SENTIMENT NEUTRAL_SENTIMENT NEGATIVE_SENTIMENT'.include?(k.to_s)
                          expect(GraphqlHelpers.get_total_value(data, k.to_s).compact).to eq GraphqlHelpers.get_total_value(data, k.to_s).compact.sort.reverse
                        elsif %w'NET_SENTIMENT VOLUME'.include?(k.to_s)
                          expect(JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact).to eq JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact.sort.reverse
                        elsif %w'RANK SUB_LENS'.include? k.to_s
                          expect(JsonPath.on(data, '$..["' + v + '"]').compact).to eq JsonPath.on(data, '$..["' + v + '"]').compact.sort.reverse
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_metrics_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["metrics"]["nodes"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
      
      context 'japanese character search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.japanese_character_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
        end
      end
      
      context 'filter' do
        context 'operator - ==' do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_filter("filter: \"trendMetrics.tpvRank==#{GraphqlDataService.tpv_rank[9]}\"")) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
          end
          it 'returns expected filtered data' do
            JsonPath.on(response[:json], '$..["tpvRank"]').each do |data|
              expect(data).to eq GraphqlDataService.tpv_rank[9]
            end
          end
        end
        
        context 'operator - >=' do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_filter("filter: \"trendMetrics.tpvRank>=#{GraphqlDataService.tpv_rank[9]}\"")) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
          end
          it 'returns expected filtered data' do
            JsonPath.on(response[:json], '$..["tpvRank"]').each do |data|
              expect(data).to be >= GraphqlDataService.tpv_rank[9]
            end
          end
        end
        
        context 'operator - <=' do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_runs_tpv_filter("filter: \"trendMetrics.tpvRank<=#{GraphqlDataService.tpv_rank[9].to_s}\"")) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metrics_full)
          end
          it 'returns expected filtered data' do
            JsonPath.on(response[:json], '$..["tpvRank"]').each do |data|
              expect(data).to be <= GraphqlDataService.tpv_rank[9]
            end
          end
        end
      end
    end
    
    context 'metrics via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metrics_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_run_tpv_with_args('page:2')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metrics_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? or pipelines['run'].nil?
            expect(pipelines['run']['tpv']['metrics']['pageInfo']['page']).to eq 2
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_run_tpv_with_args('pageSize:5')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metrics_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? or pipelines['run'].nil?
            expect(pipelines['run']['tpv']['metrics']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? or pipelines['run'].nil?
            expect(pipelines['run']['tpv']['metrics']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_run_tpv_metrics_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metrics_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["metrics"]["nodes"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'metrics via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_last_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_last_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metrics_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_last_run_tpv_with_args('page:2')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metrics_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? or pipelines['lastRun'].nil?
            expect(pipelines['lastRun']['tpv']['metrics']['pageInfo']['page']).to eq 2
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_last_run_tpv_with_args('pageSize:5')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metrics_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? or pipelines['lastRun'].nil?
            expect(pipelines['lastRun']['tpv']['metrics']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? or pipelines['lastRun'].nil?
            expect(pipelines['lastRun']['tpv']['metrics']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipelines_last_run_tpv_metrics_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metrics_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["metrics"]["nodes"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'metrics via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_runs_tpv_metrics(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_runs_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metrics_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_runs_tpv_with_args('page:2')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metrics_full)
        end
        it 'returns expected page number in pageInfo' do
          response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
            next if runs.empty?
            expect(runs['tpv']['metrics']['pageInfo']['page']).to eq 2
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_runs_tpv_with_args('pageSize:5')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metrics_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
            next if runs.empty?
            expect(runs['tpv']['metrics']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
            next if runs.empty?
            expect(runs['tpv']['metrics']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_runs_tpv_metrics_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metrics_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["metrics"]["nodes"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'metrics via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metrics_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_run_tpv_with_args('page:2')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metrics_full)
        end
        it 'returns expected page in pageInfo' do
          next if response[:json]['data']['pipeline']['run'].nil? or response[:json]['data']['pipeline']['run'].empty?
          expect(response[:json]['data']['pipeline']['run']['tpv']['metrics']['pageInfo']['page']).to eq 2
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_run_tpv_with_args('pageSize:5')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metrics_full)
        end
        it 'returns expected page_size in response' do
          next if response[:json]['data']['pipeline']['run'].nil? or response[:json]['data']['pipeline']['run'].empty?
          expect(response[:json]['data']['pipeline']['run']['tpv']['metrics']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          next if response[:json]['data']['pipeline']['run'].nil? or response[:json]['data']['pipeline']['run'].empty?
          expect(response[:json]['data']['pipeline']['run']['tpv']['metrics']['pageInfo']['pageSize']).to eq 5
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_run_tpv_metrics_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metrics_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["metrics"]["nodes"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
    
    context 'metrics via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_last_run_tpv_metrics(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metrics_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_last_run_tpv_metrics(TpvMetricDefinitions.rand_tpv_metric)) }
          
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
            expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metrics_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_last_run_tpv_with_args('page:2')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metrics_full)
        end
        it 'returns expected page in pageInfo' do
          next if response[:json]['data']['pipeline']['lastRun'].nil? or response[:json]['data']['pipeline']['lastRun'].empty?
          expect(response[:json]['data']['pipeline']['lastRun']['tpv']['metrics']['pageInfo']['page']).to eq 2
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_last_run_tpv_with_args('pageSize:5')) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metrics_full)
        end
        it 'returns expected page_size in response' do
          next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
          expect(response[:json]['data']['pipeline']['lastRun']['tpv']['metrics']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
          expect(response[:json]['data']['pipeline']['lastRun']['tpv']['metrics']['pageInfo']['pageSize']).to eq 5
        end
      end
      
      context 'search' do
        let(:response) { Requests.graphql(TpvMetricsQueries.pipeline_last_run_tpv_metrics_search(TpvMetricDefinitions.tpv_metric)) }
        
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
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metrics_full)
        end
        it 'returns subLens relevant to search' do
          JsonPath.on(response[:json], '$..["metrics"]["nodes"][*]["subLens"]').each do |data|
            expect(data.downcase).to including(GraphqlDataService.metric_args['subLens'].downcase)
          end
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvMetricsQueries.invalid_field) }
      
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
      let(:response) { Requests.graphql(TpvMetricsQueries.invalid_search_value(TpvMetricDefinitions.tpv_metric)) }
      
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
      let(:response) { Requests.graphql(TpvMetricsQueries.missing_search_value(TpvMetricDefinitions.tpv_metric)) }
      
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
    
    context 'invalid page size value' do
      let(:response) { Requests.graphql(TpvMetricsQueries.invalid_page_size_value) }
      
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
    
    context 'missing required sub fields' do
      let(:response) { Requests.graphql(TpvMetricsQueries.missing_required_sub_field) }
      
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
      let(:response) { Requests.graphql(TpvMetricsQueries.invalid_field_with_sub_field) }
      
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
    
    context 'invalid filter' do
      let(:response) { Requests.graphql(TpvMetricsQueries.invalid_filter) }
      
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