require './spec/graphql_api/trendscope/query/stats/support/pipeline_step_times_queries'
require './spec/graphql_api/trendscope/definitions/stats_definitions'
require './spec/graphql_api/trendscope/query/stats/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'

describe 'pipeline_step_times' do
  context 'positive tests' do
    context 'without date filter' do
      context 'all fields' do
        let(:response) { Requests.graphql(PipelineStepTimesQueries.pipeline_step_times_no_filter(StatsDefinitions.pipeline_step_times)) }

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
          expect(response).to match_schema(StatsSupport.pipeline_step_times_schema_full)
        end
      end
      
      context 'randomised fields' do
        let(:response) { Requests.graphql(PipelineStepTimesQueries.pipeline_step_times_no_filter(StatsDefinitions.rand_pipeline_step_times)) }

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
          expect(response).to match_schema(StatsSupport.pipeline_step_times_schema_rand)
        end
      end
    end

    context 'with date filter' do
      context 'all fields' do
        let(:response) { Requests.graphql(PipelineStepTimesQueries.pipeline_step_times_with_filter(StatsDefinitions.pipeline_step_times)) }
        
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
          expect(response).to match_schema(StatsSupport.pipeline_step_times_schema_full)
        end
      end
  
      context 'randomised fields' do
        let(:response) { Requests.graphql(PipelineStepTimesQueries.pipeline_step_times_with_filter(StatsDefinitions.rand_pipeline_step_times)) }

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
          expect(response).to match_schema(StatsSupport.pipeline_step_times_schema_rand)
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelineStepTimesQueries.invalid_field) }

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
      let(:response) { Requests.graphql(PipelineStepTimesQueries.invalid_subfield_on_field) }

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


