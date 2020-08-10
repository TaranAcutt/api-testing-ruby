require './spec/graphql_api/trendscope/query/pipeline_step/support/pipeline_steps_queries'
require './spec/graphql_api/trendscope/definitions/step_definitions'
require './spec/graphql_api/trendscope/query/pipeline_step/support/support'

describe 'pipeline_steps' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(PipelineStepsQueries.steps_query(StepDefinitions.step)) }

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
        expect(response).to match_schema(StepSupport.pipeline_steps_schema_full)
      end
    end

    context 'randomised fields' do
      let(:response) { Requests.graphql(PipelineStepsQueries.steps_query(StepDefinitions.rand_step)) }

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
        expect(response).to match_schema(StepSupport.pipeline_steps_schema_rand)
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelineStepsQueries.invalid_field) }

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
      let(:response) { Requests.graphql(PipelineStepsQueries.missing_required_sub_field) }

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

    context 'sub field on invalid field' do
      let(:response) { Requests.graphql(PipelineStepsQueries.sub_field_on_invalid_field) }

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

    context 'invalid argument type' do
      let(:response) { Requests.graphql(PipelineStepsQueries.invalid_argument_type) }

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


