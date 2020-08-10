require './spec/graphql_api/trendscope/query/pipeline_tags/support/pipeline_tags_queries'
require './spec/graphql_api/trendscope/query/pipeline_tags/support/pipeline_tags_schema'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'

describe 'pipeline_tags' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(PipelineTagsQueries.pipeline_tags_query) }

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
        expect(response).to match_schema(PipelineTagsSchema.pipeline_tags_schema)
      end
    end

    context 'all fields - empty search' do
      let(:response) { Requests.graphql(PipelineTagsQueries.pipeline_tags_with_empty_search_query) }
  
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
        expect(response).to match_schema(PipelineTagsSchema.pipeline_tags_schema)
      end
    end

    context 'all fields - search' do
      let(:response) { Requests.graphql(PipelineTagsQueries.pipeline_tags_with_search_query) }
  
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
        expect(response).to match_schema(PipelineTagsSchema.pipeline_tags_schema)
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid search type' do
      let(:response) { Requests.graphql(PipelineTagsQueries.invalid_search_type) }

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

    context 'invalid sub field' do
      let(:response) { Requests.graphql(PipelineTagsQueries.invalid_sub_field) }

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


