require './spec/graphql_api/trendscope/query/streams/support/streams_queries'
require './spec/graphql_api/trendscope/definitions/streams_definitions'
require './spec/graphql_api/trendscope/query/streams/support/support'

describe 'streams' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(StreamsQueries.streams_query(StreamsDefinitions.stream)) }
      
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
        expect(response).to match_schema(StreamsSupport.streams_schema_full)
      end
    end
    
    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.rand_stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamsQueries.streams_query(StreamsDefinitions.rand_stream)) }
        
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
          expect(response).to match_schema(StreamsSupport.streams_schema_rand)
        end
      end
    end
    
    context 'page' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamsQueries.streams_with_args_query(StreamsDefinitions.stream, 'page: 2')) }
        
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
          expect(response).to match_schema(StreamsSupport.streams_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['streams']['pageInfo']['page']).to eq 2
        end
      end
    end
    
    context 'page size' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamsQueries.streams_with_args_query(StreamsDefinitions.stream, 'pageSize: 2')) }
        
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
          expect(response).to match_schema(StreamsSupport.streams_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['streams']['pageInfo']['pageSize']).to eq 2
        end
        
        it 'returns count in line with pageSize' do
          expect(response[:json]['data']['streams']['nodes'].count).to be <= 2
        end
      end
    end
    
    context 'filtered by internal key' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(StreamsDefinitions.stream, :property_name).join(', ') do
        let(:response) { Requests.graphql(StreamsQueries.streams_with_args_query(StreamsDefinitions.stream, 'internalKeyIn: ["' + GraphqlDataService.internal_key + '"]')) }
        
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
          expect(response).to match_schema(StreamsSupport.streams_schema_full)
        end
        it 'returns expected stream' do
          expect(JsonPath.on(response[:json], '$..["streams"]["nodes"][*]["internalKey"]')[0]).to eq GraphqlDataService.internal_key
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(StreamsQueries.invalid_field) }
      
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
      let(:response) { Requests.graphql(StreamsQueries.invalid_field_with_sub_field) }
      
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
      let(:response) { Requests.graphql(StreamsQueries.invalid_internal_key_type) }
      
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



