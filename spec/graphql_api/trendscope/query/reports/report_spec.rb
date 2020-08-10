require './spec/graphql_api/trendscope/query/reports/support/tpv_report_queries'
require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'
require './spec/graphql_api/trendscope/query/reports/support/support'

describe 'report' do
  context 'positive tests' do
    context 'all fields' do
      let(:response)   { Requests.graphql(TpvReportQueries.reports_tpv_report(TpvReportDefinitions.tpv_report)) }

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
        expect(response).to match_schema(ReportsSupport.reports_tpv_report_schema_full)
      end
    end

    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.rand_tpv_report, :property_name).join(', ') do
        let(:response)   { Requests.graphql(TpvReportQueries.reports_tpv_report(TpvReportDefinitions.rand_tpv_report)) }

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
          expect(response).to match_schema(ReportsSupport.reports_tpv_report_schema_rand)
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvReportQueries.invalid_field) }

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

    context 'invalid id value' do
      let(:response) { Requests.graphql(TpvReportQueries.invalid_id_value) }

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
      let(:response) { Requests.graphql(TpvReportQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(TpvReportQueries.invalid_field_with_sub_field) }

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

