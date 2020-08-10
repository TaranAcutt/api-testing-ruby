require './spec/graphql_api/trendscope/query/stream_groups/support/stream_groups_queries'
require './spec/graphql_api/trendscope/definitions/streams_definitions'
require './spec/graphql_api/trendscope/query/stream_groups/support/support'

describe 'stream_groups' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(StreamGroupsQueries.stream_groups_query(StreamsDefinitions.stream_groups)) }
      
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
        expect(response).to match_schema(StreamGroupsSupport.stream_groups_schema_full)
      end
    end
    
    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.rand_stream_groups, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamGroupsQueries.stream_groups_query(StreamsDefinitions.rand_stream_groups)) }
        
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
          expect(response).to match_schema(StreamGroupsSupport.stream_groups_schema_rand)
        end
      end
    end
    
    context 'page' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamGroupsQueries.stream_groups_with_args_query(StreamsDefinitions.stream_groups, 'page: 2')) }
        
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
          expect(response).to match_schema(StreamGroupsSupport.stream_groups_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['streamGroups']['pageInfo']['page']).to eq 2
        end
      end
    end
    
    context 'page size' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamGroupsQueries.stream_groups_with_args_query(StreamsDefinitions.stream_groups, 'pageSize: 2')) }
        
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
          expect(response).to match_schema(StreamGroupsSupport.stream_groups_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['streamGroups']['pageInfo']['pageSize']).to eq 2
        end
        it 'returns count in line with pageSize' do
          expect(response[:json]['data']['streamGroups']['nodes'].count).to be <= 2
        end
      end
    end
    
    context 'filtered by internal key' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamGroupsQueries.stream_groups_with_args_query(StreamsDefinitions.stream_groups, 'internalKeyIn: ["' + GraphqlDataService.stream_group_internal_key + '"]')) }
        
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
          expect(response).to match_schema(StreamGroupsSupport.stream_groups_schema_full)
        end
        it 'returns expected stream' do
          expect(JsonPath.on(response[:json], '$..["streamGroups"]["nodes"][*]["internalKey"]')[0]).to eq GraphqlDataService.stream_group_internal_key
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(StreamGroupsQueries.invalid_field) }
      
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
      let(:response) { Requests.graphql(StreamGroupsQueries.invalid_field_with_sub_field) }
      
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
    
    context 'invalid internal_key type' do
      let(:response) { Requests.graphql(StreamGroupsQueries.invalid_internal_key_type) }
      
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



