require './spec/graphql_api/trendscope/query/reference_data/support/tpv_phases_queries'
require './spec/graphql_api/trendscope/definitions/reference_data_definitions'
require './spec/graphql_api/trendscope/query/reference_data/support/support'

describe 'tpv phases' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(TpvPhasesQueries.tpv_phases_query(ReferenceDataDefinitions.tpv_phases)) }

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
        expect(response).to match_schema(ReferenceDataSupport.tpv_phases_schema_full)
      end
    end

    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(ReferenceDataDefinitions.rand_tpv_phases, :property_name).join(', ') do
        let(:response) { Requests.graphql(TpvPhasesQueries.tpv_phases_query(ReferenceDataDefinitions.rand_tpv_phases)) }

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
          expect(response).to match_schema(ReferenceDataSupport.tpv_phases_schema_rand)
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvPhasesQueries.invalid_field) }

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
      let(:response) { Requests.graphql(TpvPhasesQueries.invalid_field_with_sub_field) }

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



