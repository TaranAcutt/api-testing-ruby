require './spec/graphql_api/trendscope/query/association_metric/support/associated_queries'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'
require './spec/graphql_api/trendscope/query/association_metric/support/associated_schema'

describe 'associated' do
  context 'positive tests' do
    context 'successful filter' do
      let(:response) { Requests.graphql(AssociatedQueries.pipeline_runs_associated) }
      
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
        expect(response).to match_schema(AssociatedSchema.pipeline_runs_associated_schema_full)
      end
    end
    
    context 'association strength' do
      let(:response) { Requests.graphql(AssociatedQueries.association_with_strength) }
      
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
        expect(response).to match_schema(AssociatedSchema.pipelines_runs_associated_schema_full)
      end
    end
    
    context 'association query type' do
      %w'AND OR'.each do |query_type|
        context 'type - ' + query_type do
          let(:response) { Requests.graphql(AssociatedQueries.association_query_type(query_type)) }
          
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
            expect(response).to match_schema(AssociatedSchema.pipelines_runs_associated_schema_full)
          end
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid filter' do
      let(:response) { Requests.graphql(AssociatedQueries.invalid_filter) }
      
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
    
    context 'invalid association query type' do
      let(:response) { Requests.graphql(AssociatedQueries.invalid_filter) }
      
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
      let(:response) { Requests.graphql(AssociatedQueries.missing_required_argument) }
      
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
