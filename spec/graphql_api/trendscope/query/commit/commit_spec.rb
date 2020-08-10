require './spec/graphql_api/trendscope/query/commit/support/commit_queries'
require './spec/graphql_api/trendscope/query/commit/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/commit_definitions'

describe 'commit' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(CommitQueries.commit_query) }
      
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
        expect(response).to match_schema(CommitSupport.commit_schema_full)
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field on sub field' do
      let(:response) { Requests.graphql(CommitQueries.invalid_field) }

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
    
    context 'invalid field on sub field' do
      let(:response) { Requests.graphql(CommitQueries.invalid_sub_field) }

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


