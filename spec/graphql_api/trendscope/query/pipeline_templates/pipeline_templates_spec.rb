require './spec/graphql_api/trendscope/query/pipeline_templates/support/pipeline_templates_queries'
require './spec/graphql_api/trendscope/query/pipeline_templates/support/support'

describe 'pipeline templates' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(PipelineTemplatesQueries.pipeline_templates_query) }
      
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
        expect(response).to match_schema(PipelineTemplatesSupport.pipeline_templates_schema_full)
      end
    end
    
    context 'randomised fields' do
      let(:response) { Requests.graphql(PipelineTemplatesQueries.rand_pipeline_templates_query) }
      
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
        expect(response).to match_schema(PipelineTemplatesSupport.pipeline_templates_schema_rand)
      end
    end
  end
  
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelineTemplatesQueries.invalid_field_query) }
      
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
      let(:response) { Requests.graphql(PipelineTemplatesQueries.invalid_sub_field_query) }
      
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


