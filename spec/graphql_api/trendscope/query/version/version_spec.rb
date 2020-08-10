require './spec/graphql_api/trendscope/query/version/support/version_queries'
require './spec/graphql_api/trendscope/query/version/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/definitions/version_definitions'

describe 'version' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(VersionQueries.version_query) }

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
        expect(response).to match_schema(VersionSupport.version_schema_full)
      end
    end
  end

  context 'negative tests' do
    context 'invalid field on sub field' do
      let(:response) { Requests.graphql(VersionQueries.invalid_sub_field_query) }

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


