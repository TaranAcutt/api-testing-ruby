require './spec/graphql_api/trendscope/mutation/support/create_pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/mutation_pipeline_schema'
require './spec/graphql_api/trendscope/mutation/support/create_mutation_variables'
require './spec/graphql_api/trendscope/definitions/step_definitions'
require './spec/graphql_api/trendscope/mutation/support/delete_pipeline_queries'

describe 'create_pipeline' do
  context 'positive tests' do
    context 'successful pipeline creation' do
      context 'single step' do
        let(:json) { Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(CreateMutationVariables.single_step_pipeline, CreateMutationVariables.single_step)) }
        let(:schema) { MutationPipelineSchema.create_pipeline_full_schema }

        context 'create pipeline' do
          it 'returns OK (200) status code' do
            expect(json[:raw].code).to eq 200
          end

          it 'data conforms to createPipeline schema' do
            expect(json).to match_schema(schema)
          end

          it 'returns a response without errors' do
            expect(json['errors']).to be_nil
          end
        end

        context 'delete pipeline' do
          let(:pipeline_id) { json['data']['createPipeline']['id'] }
          let(:delete) { Requests.graphql(DeletePipelineQueries.delete_pipeline_mutation_query(pipeline_id))[:json] }
          let(:delete_req) { Requests.graphql(DeletePipelineQueries.delete_pipeline_mutation_query(pipeline_id))[:raw] }
          let(:delete_schema) { MutationPipelineSchema.delete_pipeline_schema }

          it 'returns OK (200) status code' do
            expect(delete_req.code).to eq 200
          end

          it 'data conforms to deletePipeline schema' do
            expect(delete).to match_schema(delete_schema)
          end

          it 'returns a response without errors' do
            expect(delete['errors']).to be_nil
          end
        end
      end

      context 'linked steps' do
        let(:json) { Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(CreateMutationVariables.linked_step_pipeline, CreateMutationVariables.linked_step))[:json] }
        let(:raw) { Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(CreateMutationVariables.linked_step_pipeline, CreateMutationVariables.linked_step))[:raw] }
        let(:schema) { MutationPipelineSchema.create_pipeline_full_schema }

        context 'create pipeline' do
          it 'returns OK (200) status code' do
            expect(raw.code).to eq 200
          end

          it 'data conforms to createPipeline schema' do
            expect(json).to match_schema(schema)
          end

          it 'returns a response without errors' do
            expect(json['errors']).to be_nil
          end
        end

        context 'delete pipeline' do
          let(:pipeline_id) { json['data']['createPipeline']['id'] }
          let(:delete) { Requests.graphql(DeletePipelineQueries.delete_pipeline_mutation_query(pipeline_id))[:json] }
          let(:delete_req) { Requests.graphql(DeletePipelineQueries.delete_pipeline_mutation_query(pipeline_id))[:raw] }
          let(:delete_schema) { MutationPipelineSchema.delete_pipeline_schema }

          it 'returns OK (200) status code' do
            expect(delete_req.code).to eq 200
          end

          it 'data conforms to deletePipeline schema' do
            expect(delete).to match_schema(delete_schema)
          end

          it 'returns a response without errors' do
            expect(delete['errors']).to be_nil
          end
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid arguments' do
      let(:json) { Requests.graphql(CreatePipelineQueries.invalid_argument)[:json] }
      let(:raw) { Requests.graphql(CreatePipelineQueries.invalid_argument)[:raw] }

      include_examples 'graphql BadRequest response'
    end

    context 'invalid argument type' do
      let(:json) { Requests.graphql(CreatePipelineQueries.invalid_argument_type)[:json] }
      let(:raw) { Requests.graphql(CreatePipelineQueries.invalid_argument_type)[:raw] }

      include_examples 'graphql BadRequest response'
    end

    context 'missing required parent' do
      let(:json) { Requests.graphql(CreatePipelineQueries.missing_required_parent)[:json] }
      let(:raw) { Requests.graphql(CreatePipelineQueries.missing_required_parent)[:raw] }

      include_examples 'graphql BadRequest response'
    end

    context 'missing required field' do
      let(:json) { Requests.graphql(CreatePipelineQueries.missing_required_field)[:json] }
      let(:raw) { Requests.graphql(CreatePipelineQueries.missing_required_field)[:raw] }

      include_examples 'graphql BadRequest response'
    end
  end
end
