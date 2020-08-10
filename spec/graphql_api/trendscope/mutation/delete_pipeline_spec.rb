require './spec/graphql_api/trendscope/mutation/support/delete_pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/delete_mutation_variables'
require './spec/graphql_api/trendscope/mutation/support/create_pipeline_queries'
require './spec/graphql_api/trendscope/mutation/support/mutation_pipeline_schema'
require './spec/graphql_api/trendscope/query/pipeline/support/pipeline_queries'

describe 'delete_pipeline' do
  context 'positive tests' do
    context 'successful pipeline delete' do
      let(:json) { Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(DeleteMutationVariables.pipeline, DeleteMutationVariables.steps))[:json] }
      let(:raw) { Requests.graphql(CreatePipelineQueries.create_pipeline_mutation_full_query(DeleteMutationVariables.pipeline, DeleteMutationVariables.steps))[:raw] }
      let(:schema) { MutationPipelineSchema.create_pipeline_full_schema }
      let(:pipeline_id) { json['data']['createPipeline']['id'] }

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

      context 'first pipeline retrieval' do
        let(:first_get) { Requests.graphql(PipelineQueries.pipeline_by_id_query(pipeline_id))[:json] }
        let(:first_get_req) { Requests.graphql(PipelineQueries.pipeline_by_id_query(pipeline_id))[:raw] }
        let(:get_schema) { MutationPipelineSchema.get_pipeline_schema }

        it 'returns OK (200) status code' do
          expect(first_get_req.code).to eq 200
        end

        it 'returns expected pipeline id' do
          expect(first_get['data']['pipeline']['id']).to eq pipeline_id
        end

        it 'returns expected pipeline name' do
          expect(first_get['data']['pipeline']['name']).to eq 'QATESTPIPELINE3'
        end

        it 'data conforms to pipeline schema' do
          expect(first_get).to match_schema(get_schema)
        end

        it 'returns a response without errors' do
          expect(first_get['errors']).to be_nil
        end
      end

      context 'delete pipeline' do
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



      context 'second pipeline retrieval' do
        let(:second_get) { Requests.graphql(PipelineQueries.pipeline_by_id_query(pipeline_id), 'true')[:json] }
        let(:second_get_req) { Requests.graphql(PipelineQueries.pipeline_by_id_query(pipeline_id), 'true')[:raw] }

        it 'returns OK (200) status code' do
          expect(second_get_req.code).to eq 200
        end

        it 'data conforms to pipeline schema' do
          expect(second_get['data']['pipeline']).to eq nil
        end

        it 'returns a response without errors' do
          expect(second_get['errors']).to be_nil
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid arguments' do
      let(:json) { Requests.graphql(DeletePipelineQueries.invalid_argument)[:json] }
      let(:raw) { Requests.graphql(DeletePipelineQueries.invalid_argument)[:raw] }

      it 'returns (200) status code' do
        expect(raw.code).to eq 200
      end

      it 'returns content_type json' do
        expect(raw.headers[:content_type]).to start_with 'application/json'
      end

      it 'returns response matching error schema' do
        expect(json['errors']).to match_schema("#{SchemaHelpers.schemas}/support/graphql_error.json")
      end
    end

    context 'invalid argument type' do
      let(:json) { Requests.graphql(DeletePipelineQueries.invalid_argument)[:json] }
      let(:raw) { Requests.graphql(DeletePipelineQueries.invalid_argument)[:raw] }

      it 'returns (200) status code' do
        expect(raw.code).to eq 200
      end

      it 'returns content_type json' do
        expect(raw.headers[:content_type]).to start_with 'application/json'
      end

      it 'returns response matching error schema' do
        expect(json['errors']).to match_schema("#{SchemaHelpers.schemas}/support/graphql_error.json")
      end
    end
  end
end