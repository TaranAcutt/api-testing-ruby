require './spec/graphql_api/trendscope/mutation/support/update_pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/create_pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/update_mutation_variables'
require './spec/graphql_api/trendscope/query/pipeline/support/pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/create_mutation_variables'
require './spec/graphql_api/trendscope/mutation/support/delete_pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/mutation_pipeline_schema'
require './spec/graphql_api/trendscope/definitions/step_definitions'

describe 'update_pipeline' do
  context 'positive tests' do
    context 'successful update' do
      context 'successful pipeline update' do
        let(:json) {Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(UpdateMutationVariables.single_step_pipeline, UpdateMutationVariables.single_step))[:json]}
        let(:raw) {Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(UpdateMutationVariables.single_step_pipeline, UpdateMutationVariables.single_step))[:raw]}
        let(:pipeline_id) {json['data']['createPipeline']['id']}
        let(:step) {GraphqlHelpers.step_by_type(json['data']['createPipeline'], 'DATA_CURATION')}

        context 'create pipeline' do
          it 'returns OK (200) status code' do
            expect(raw.code).to eq 200
          end
          it 'data conforms to createPipeline schema' do
            expect(json).to match_schema(MutationPipelineSchema.create_pipeline_full_schema)
          end
          it 'returns a response without errors' do
            expect(json['errors']).to be_nil
          end
        end

        context 'update pipeline' do
          let(:update) {Requests.graphql(UpdatePipelineQueries.update_pipeline_mutation_query(UpdateMutationVariables.update_pipeline(pipeline_id), UpdateMutationVariables.update_step(step['id'])))[:json]}
          let(:update_req) {Requests.graphql(UpdatePipelineQueries.update_pipeline_mutation_query(UpdateMutationVariables.update_pipeline(pipeline_id),UpdateMutationVariables.update_step(step['id'])))[:raw]}
          let(:get_schema) {MutationPipelineSchema.get_pipeline_schema}

          it 'returns OK (200) status code' do
            expect(update_req.code).to eq 200
          end
          it 'data conforms to pipeline schema' do
            expect(update).to match_schema(MutationPipelineSchema.update_pipeline_full_schema)
          end
          it 'returns updated name' do
            expect(update['data']['updatePipeline']['name']).to eq 'QATESTPIPELINE4UPDATE'
          end
          it 'returns updated start date' do
            expect(update['data']['updatePipeline']['startDate']).to eq '2018-11-02'
          end
          it 'returns updated end date' do
            expect(update['data']['updatePipeline']['endDate']).to eq '2018-11-29'
          end
          it 'returns a response without errors' do
            expect(update['errors']).to be_nil
          end
        end

        context 'pipeline retrieval' do
          let(:get) {Requests.graphql(PipelineQueries.pipeline_by_id_query(pipeline_id), 'true')[:json]}
          let(:get_req) {Requests.graphql(PipelineQueries.pipeline_by_id_query(pipeline_id), 'true')[:raw]}

          it 'returns OK (200) status code' do
            expect(get_req.code).to eq 200
          end
          it 'data conforms to pipeline schema' do
            expect(get).to match_schema(MutationPipelineSchema.get_pipeline_schema)
          end
          it 'returns updated name' do
            expect(get['data']['pipeline']['name']).to eq 'QATESTPIPELINE4UPDATE'
          end
          it 'returns a response without errors' do
            expect(get['errors']).to be_nil
          end
        end

        context 'delete pipeline' do
          let(:delete) {Requests.graphql(DeletePipelineQueries.delete_pipeline_mutation_query(pipeline_id))[:json]}
          let(:delete_req) {Requests.graphql(DeletePipelineQueries.delete_pipeline_mutation_query(pipeline_id))[:raw]}
          let(:delete_schema) {MutationPipelineSchema.delete_pipeline_schema}

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

    context 'negative tests' do
      context 'invalid arguments' do
        let(:json) { Requests.graphql(UpdatePipelineQueries.invalid_argument)[:json] }
        let(:raw) { Requests.graphql(UpdatePipelineQueries.invalid_argument)[:raw] }

        include_examples 'graphql BadRequest response'
      end

      context 'invalid argument type' do
        let(:json) { Requests.graphql(UpdatePipelineQueries.invalid_argument_type)[:json] }
        let(:raw) { Requests.graphql(UpdatePipelineQueries.invalid_argument_type)[:raw] }

        include_examples 'graphql BadRequest response'
      end
    end
  end
end
