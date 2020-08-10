require './spec/graphql_api/trendscope/query/data_qa_metrics/support/qa_demographics_queries'
require './spec/graphql_api/trendscope/definitions/data_qa_metrics_definitions'
require './spec/graphql_api/trendscope/query/data_qa_metrics/support/qa_demographics_schema'
require './spec/graphql_api/trendscope/query/reference_data/support/support'
require './spec/graphql_api/trendscope/support/graphql_helpers'

describe 'qa_demographics' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(QaDemographicsQueries.qa_demographics_query) }
      
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
        expect(response).to match_schema(QaDemographicsSchema.qa_demographics_full)
      end
    end
    
    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(DataQaMetricsDefinitions.rand_qa_demographics, :property_name).join(', ') do
        let(:response) { Requests.graphql(QaDemographicsQueries.rand_qa_demographics_query) }
        
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
          expect(response).to match_schema(QaDemographicsSchema.qa_demographics_rand)
        end
      end
    end
    
    context 'filter - maxTpvRanking' do
      let(:response) { Requests.graphql(QaDemographicsQueries.qa_demographics_max_tpv_ranking_query) }
      
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
        expect(response).to match_schema(QaDemographicsSchema.qa_demographics_full)
      end
      it 'returns tpvRanks <= maximum set' do
        expect(JsonPath.on(response[:json], '$...["tpvRank"]')).to all be <= 50
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid pipeline ID' do
      let(:response) { Requests.graphql(QaDemographicsQueries.invalid_pipeline_id) }
      
      it 'returns 200 status code' do
        expect(response).to return_expected_status_code(200)
      end
      it 'returns expected content_type' do
        expect(response).to return_expected_content_type
      end
      it 'response conforms to local schema' do
        expect(response).to match_schema(QaDemographicsSchema.qa_demographics_full)
      end
      it 'response conforms to error schema' do
        expect(response).to match_graphql_error_schema
      end
    end
    
    context 'invalid field' do
      let(:response) { Requests.graphql(QaDemographicsQueries.invalid_field) }
      
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
    
    context 'field missing subfield' do
      let(:response) { Requests.graphql(QaDemographicsQueries.field_missing_sub_field) }
      
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
    
    context 'invalid subfield' do
      let(:response) { Requests.graphql(QaDemographicsQueries.invalid_field_with_sub_field) }
      
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



