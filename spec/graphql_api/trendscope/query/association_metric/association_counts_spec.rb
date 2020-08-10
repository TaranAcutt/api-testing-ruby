require './spec/graphql_api/trendscope/query/association_metric/support/association_counts_queries'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'
require './spec/graphql_api/trendscope/query/association_metric/support/association_counts_schema'

describe 'association_counts' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(AssociationCountsQueries.pipelines_runs_association_counts(AssocMetricDefinitions.association_count)) }
      
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
        expect(response).to match_schema(AssociationCountsSchema.pipelines_runs_association_counts_full)
      end
    end
    
    context 'randomised fields' do
      let(:response) { Requests.graphql(AssociationCountsQueries.pipelines_runs_association_counts(AssocMetricDefinitions.rand_association_count)) }
      
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
        expect(response).to match_schema(AssociationCountsSchema.pipelines_runs_association_counts_rand)
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(AssociationCountsQueries.invalid_field) }
      
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
      let(:response) { Requests.graphql(AssociationCountsQueries.invalid_filter) }
      
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
      let(:response) { Requests.graphql(AssociationCountsQueries.missing_required_argument) }
      
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
