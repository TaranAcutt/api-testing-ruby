require './spec/graphql_api/trendscope/query/stream_group/support/stream_group_queries'
require './spec/graphql_api/trendscope/definitions/streams_definitions'
require './spec/graphql_api/trendscope/query/stream_group/support/support'

describe 'stream_group' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(StreamGroupQueries.stream_group_query(StreamsDefinitions.stream_group)) }

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
        expect(response).to match_schema(StreamGroupSupport.stream_group_schema_full)
      end
    end

    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.rand_stream_group, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamGroupQueries.stream_group_query(StreamsDefinitions.rand_stream_group)) }

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
          expect(response).to match_schema(StreamGroupSupport.stream_group_schema_rand)
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(StreamGroupQueries.invalid_field) }

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
      let(:response) { Requests.graphql(StreamGroupQueries.invalid_field_with_sub_field) }

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

    context 'invalid internal_key type'do
      let(:response) { Requests.graphql(StreamGroupQueries.invalid_internal_key_type) }

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



