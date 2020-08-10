require './spec/graphql_api/trendscope/query/pipeline_run/support/pipeline_run_queries'
require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'
require './spec/graphql_api/trendscope/query/pipeline_run/support/support'

describe 'pipeline_run - run' do
  context 'positive tests' do
    context 'pipelineRun via pipelines' do
      context 'all fields' do
        let(:response) { Requests.graphql(PipelineRunQueries.pipelines_run_query(PipelineRunDefinitions.pipeline_run)) }

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
          expect(response).to match_schema(PipelineRunSupport.pipelines_run_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(PipelineRunDefinitions.rand_pipeline_run, :property_name).join(', ') do
          let(:response) { Requests.graphql(PipelineRunQueries.pipelines_run_query(PipelineRunDefinitions.rand_pipeline_run)) }

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
            expect(response).to match_schema(PipelineRunSupport.pipelines_run_schema_rand)
          end
        end
      end
    end
    
    context 'pipelineRun via pipeline' do
      context 'all fields' do
        let(:response) { Requests.graphql(PipelineRunQueries.pipeline_run_query(PipelineRunDefinitions.pipeline_run)) }

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
          expect(response).to match_schema(PipelineRunSupport.pipeline_run_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(PipelineRunDefinitions.rand_pipeline_run, :property_name).join(', ') do
          let(:response) { Requests.graphql(PipelineRunQueries.pipeline_run_query(PipelineRunDefinitions.rand_pipeline_run)) }

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
            expect(response).to match_schema(PipelineRunSupport.pipeline_run_schema_rand)
          end
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelineRunQueries.invalid_field) }

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
    
    context 'invalid id value' do
      let(:response) { Requests.graphql(PipelineRunQueries.invalid_id_value) }

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
      let(:response) { Requests.graphql(PipelineRunQueries.invalid_pipeline_argument) }

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
      let(:response) { Requests.graphql(PipelineRunQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(PipelineRunQueries.invalid_field_with_sub_field) }

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



