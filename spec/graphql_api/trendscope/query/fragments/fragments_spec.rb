require './spec/graphql_api/trendscope/query/fragments/support/misc_queries'
require './spec/graphql_api/trendscope/query/fragments/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'

describe 'fragments' do
  context 'valid fragment' do
    let(:response) { Requests.graphql(MiscQueries.fragment_query) }

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
      expect(response).to match_schema(MiscellaneousSupport.fragment_schema)
    end
  end

  context 'invalid fragment' do
    let(:response) { Requests.graphql(MiscQueries.invalid_fragment_query) }

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


