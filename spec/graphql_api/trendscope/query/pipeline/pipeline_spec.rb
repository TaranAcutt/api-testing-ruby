require './spec/graphql_api/trendscope/query/pipeline/support/pipeline_queries'
require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/query/pipeline/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/support/graphql_data_service'

describe 'pipeline' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(PipelineQueries.pipeline_query(PipelineDefinitions.pipeline)) }
      
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
        expect(response).to match_schema(PipelineSupport.pipeline_schema_full)
      end
    end
    
    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.rand_pipeline, :property_name).join(', ') do
        let(:response) { Requests.graphql(PipelineQueries.pipeline_query(PipelineDefinitions.rand_pipeline)) }
        
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
          expect(response).to match_schema(PipelineSupport.pipeline_schema_rand)
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelineQueries.invalid_field) }
      
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
    
    context 'invalid pipeline_run argument' do
      let(:response) { Requests.graphql(PipelineQueries.invalid_pipeline_argument) }
      
      
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
      let(:response) { Requests.graphql(PipelineQueries.missing_required_sub_field) }
      
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
      let(:response) { Requests.graphql(PipelineQueries.invalid_field_with_sub_field) }
      
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



