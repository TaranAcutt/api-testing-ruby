require './spec/graphql_api/trendscope/query/stats/support/mongo_disk_usage_over_time_queries'
require './spec/graphql_api/trendscope/query/stats/support/support'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'

describe 'mongo_disk_usage_over_time' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.mongo_disk_usage_over_time_query(StatsDefinitions.mongo_disk_space)) }
      
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
        expect(response).to match_schema(StatsSupport.mongo_disk_usage_over_time_schema_full)
      end
    end
    
    context 'randomised fields' do
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.mongo_disk_usage_over_time_query(StatsDefinitions.rand_mongo_disk_space)) }
      
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
        expect(response).to match_schema(StatsSupport.mongo_disk_usage_over_time_schema_rand)
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.invalid_field) }
      
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
    
    context 'missing required arguments' do
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.missing_required_arguments) }
      
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
    
    context 'invalid date value' do
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.invalid_date_value) }
      
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
    
    context 'invalid date type' do
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.invalid_date_type) }
      
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
      let(:response) { Requests.graphql(MongoDiskUsageOverTimeQueries.invalid_sub_field) }
      
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


