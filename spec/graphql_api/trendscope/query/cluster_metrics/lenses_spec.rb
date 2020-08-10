require './spec/graphql_api/trendscope/query/association_metric/support/assoc_metrics_queries'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'
require './spec/graphql_api/trendscope/query/association_metric/support/assoc_metrics_schema'

describe 'lenses' do
  context 'positive tests' do
    context 'metrics via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
        end
        it 'returns supportAB within expected bounds' do
          JsonPath.on(response[:json], '$..["lift"]').each do |data|
            support_a = data['supportA']
            support_b = data['supportB']
            support_ab = data['supportAB']
            max = [support_a, support_b].min
            expect(0..max).to cover(support_ab)
          end
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_with_args('page:2')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty?
            pipelines['runs']['nodes'].each do |runs|
              next if runs.empty?
              expect(runs['association']['metrics']['pageInfo']['page']).to eq 2
            end
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_with_args('pageSize:5')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty?
            pipelines['runs']['nodes'].each do |runs|
              next if runs.empty?
              expect(runs['association']['metrics']['nodes'].count).to be <= 5
            end
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty?
            pipelines['runs']['nodes'].each do |runs|
              next if runs.empty?
              expect(runs['association']['metrics']['pageInfo']['pageSize']).to eq 5
            end
          end
        end
      end
      
      context 'total_count' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
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
            [VOLUME: 'volume', POSITIVE_SENTIMENT: 'positiveSentiment', NEGATIVE_SENTIMENT: 'negativeSentiment', NEUTRAL_SENTIMENT: 'neutralSentiment', NET_SENTIMENT: 'netSentiment'].each do |value|
              value.each do |k, v|
                context 'field - ' + k.to_s do
                  let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_with_args("orderBy: {field: #{k}, direction: #{direction}}")) }

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
                    expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
                  end
                  it 'returns ' + v + ' in ' + direction + ' order' do
                    JsonPath.on(response[:json], '$..["metrics"]["nodes"]').each do |data|
                      if direction == 'ASC'
                        if %w[POSITIVE_SENTIMENT NEUTRAL_SENTIMENT NEGATIVE_SENTIMENT].include?(k.to_s)
                          expect(GraphqlHelpers.get_total_value(data, k.to_s).compact).to eq GraphqlHelpers.get_total_value(data, k.to_s).compact.sort
                        elsif %w[NET_SENTIMENT VOLUME].include?(k.to_s)
                          expect(JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact).to eq JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact.sort
                        end
                      elsif direction == 'DESC'
                        if %w[POSITIVE_SENTIMENT NEUTRAL_SENTIMENT NEGATIVE_SENTIMENT].include?(k.to_s)
                          expect(GraphqlHelpers.get_total_value(data, k.to_s).compact).to eq GraphqlHelpers.get_total_value(data, k.to_s).compact.sort.reverse
                        elsif %w[NET_SENTIMENT VOLUME].include?(k.to_s)
                          expect(JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact).to eq JsonPath.on(data, '$..["' + v + '"]["totalValue"]').compact.sort.reverse
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
      
      context 'filter' do
        context 'operator - ==' do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_with_args("filter: \"association.category==\\\"#{GraphqlDataService.association_category[1]}\\\"\"")) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
          end
          it 'returns expected filtered data' do
            JsonPath.on(response[:json], '$..["association"]["category"]').each do |data|
              expect(data).to eq GraphqlDataService.association_category[1]
            end
          end
        end
      end
    end
    
    context 'metrics via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_run_assoc_metrics_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_run_assoc_with_args('page:2')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_run_assoc_metrics_schema_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? || pipelines['run'].nil?
            expect(pipelines['run']['association']['metrics']['pageInfo']['page']).to eq 2
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_run_assoc_with_args('pageSize:5')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_run_assoc_metrics_schema_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? || pipelines['run'].nil?
            expect(pipelines['run']['association']['metrics']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? || pipelines['run'].nil?
            expect(pipelines['run']['association']['metrics']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
    end
    
    context 'metrics via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_last_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_last_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_last_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_last_run_assoc_metrics_schema_rand)
          end
        end
      end
      
      context 'page' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_last_run_assoc_with_args('page:2')) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_last_run_assoc_metrics_schema_full)
          end
          it 'returns expected page in pageInfo' do
            response[:json]['data']['pipelines']['nodes'].each do |pipelines|
              next if pipelines.empty? || pipelines['lastRun'].nil?
              expect(pipelines['lastRun']['association']['metrics']['pageInfo']['page']).to eq 2
            end
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_last_run_assoc_with_args('pageSize:5')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_last_run_assoc_metrics_schema_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? || pipelines['lastRun'].nil?
            expect(pipelines['lastRun']['association']['metrics']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            next if pipelines.empty? || pipelines['lastRun'].nil?
            expect(pipelines['lastRun']['association']['metrics']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
    end
    
    context 'metrics via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_runs_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_runs_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_runs_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipeline_runs_assoc_metrics_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_runs_assoc_with_args('page:2')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_runs_assoc_metrics_schema_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
            next if runs.empty?
            expect(runs['association']['metrics']['pageInfo']['page']).to eq 2
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_runs_assoc_with_args('pageSize:5')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_runs_assoc_metrics_schema_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
            next if runs.empty?
            expect(runs['association']['metrics']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipeline']['runs']['nodes'].each do |runs|
            next if runs.empty?
            expect(runs['association']['metrics']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
    end
    
    context 'metrics via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipeline_run_assoc_metrics_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_run_assoc_with_args('page:2')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_run_assoc_metrics_schema_full)
        end
        it 'returns expected page in pageInfo' do
          next if response[:json]['data']['pipeline']['run'].nil? || response[:json]['data']['pipeline']['run'].empty?
          expect(response[:json]['data']['pipeline']['run']['association']['metrics']['pageInfo']['page']).to eq 2
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_run_assoc_with_args('pageSize:5')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_run_assoc_metrics_schema_full)
        end
        it 'returns expected page_size in response' do
          next if response[:json]['data']['pipeline']['run'].nil? || response[:json]['data']['pipeline']['run'].empty?
          expect(response[:json]['data']['pipeline']['run']['association']['metrics']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          next if response[:json]['data']['pipeline']['run'].nil? || response[:json]['data']['pipeline']['run'].empty?
          expect(response[:json]['data']['pipeline']['run']['association']['metrics']['pageInfo']['pageSize']).to eq 5
        end
      end
    end
    
    context 'metrics via pipeline > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_last_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_last_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_last_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipeline_last_run_assoc_metrics_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_last_run_assoc_with_args('page:2')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_last_run_assoc_metrics_schema_full)
        end
        it 'returns expected page in pageInfo' do
          next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
          expect(response[:json]['data']['pipeline']['lastRun']['association']['metrics']['pageInfo']['page']).to eq 2
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_last_run_assoc_with_args('pageSize:5')) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_last_run_assoc_metrics_schema_full)
        end
        it 'returns expected page_size in response' do
          next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
          expect(response[:json]['data']['pipeline']['lastRun']['association']['metrics']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          next if response[:json]['data']['pipeline']['lastRun'].nil? || response[:json]['data']['pipeline']['lastRun'].empty?
          expect(response[:json]['data']['pipeline']['lastRun']['association']['metrics']['pageInfo']['pageSize']).to eq 5
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_page_size_value) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_order_by_direction) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_order_by_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_field_with_sub_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_filter) }

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
    
    context '^= with invalid filter value' do
      let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_with_args('filter: "(subLens^=\"-a-z\")"')) }

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
        expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
      end
    end
    
    context 'invalid operator' do
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_operator) }

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
        expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
      end
    end
  end
end
