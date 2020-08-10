require './spec/graphql_api/trendscope/query/association_metric/support/associated_metrics_queries'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'
require './spec/graphql_api/trendscope/query/association_metric/support/associated_metrics_schema'

describe 'associated_metrics' do
  context 'positive tests' do
    context 'successful filter - all fields' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.pipeline_runs_associated_metrics(AssocMetricDefinitions.associated)) }

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
        expect(response).to match_schema(AssociatedMetricsSchema.pipeline_runs_associated_metrics_full)
      end
    end

    context 'successful filter - random fields' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.pipeline_runs_associated_metrics(AssocMetricDefinitions.rand_associated)) }

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
        expect(response).to match_schema(AssociatedMetricsSchema.pipeline_runs_associated_metrics_rand)
      end
    end

    context 'association strength' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.association_with_strength) }

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
        expect(response).to match_schema(AssociatedMetricsSchema.pipelines_runs_associated_metrics_full)
      end
    end

    context 'association query type' do
      %w'AND OR'.each do |query_type|
        context 'type - ' + query_type do
          let(:response) { Requests.graphql(AssociatedMetricsQueries.association_query_type(query_type)) }
      
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
            expect(response).to match_schema(AssociatedMetricsSchema.pipelines_runs_associated_metrics_full)
          end
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid filter' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.invalid_filter) }

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

    context 'invalid field' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.invalid_field) }

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

    context 'invalid subField' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.invalid_sub_field) }

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

    context 'missing required argument' do
      let(:response) { Requests.graphql(AssociatedMetricsQueries.missing_required_argument) }

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
