require './spec/graphql_api/trendscope/query/step_schemas/support/step_schema_queries'
require './spec/graphql_api/trendscope/query/step_schemas/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'

describe 'step_schemas' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(StepSchemasQueries.step_schemas_query) }

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
        expect(response).to match_schema(StepSchemasSupport.step_schemas_schema_full)
      end
    end
    
    context 'randomised fields' do
      let(:response) { Requests.graphql(StepSchemasQueries.rand_step_schemas_query) }

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
        expect(response).to match_schema(StepSchemasSupport.step_schemas_schema_rand)
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(StepSchemasQueries.invalid_field_query) }

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
      let(:response) { Requests.graphql(StepSchemasQueries.invalid_sub_field_query) }

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


