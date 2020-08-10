require './spec/graphql_api/trendscope/query/reports/support/tpv_reports_queries'
require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'
require './spec/graphql_api/trendscope/query/reports/support/support'

describe 'reports' do
  context 'positive tests' do
    context 'TpvReports via pipelines' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipelines_tpv_reports(TpvReportDefinitions.tpv_report)) }

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
          expect(response).to match_schema(ReportsSupport.pipelines_tpv_reports_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.rand_tpv_report, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvReportsQueries.pipelines_tpv_reports(TpvReportDefinitions.rand_tpv_report)) }

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
            expect(response).to match_schema(ReportsSupport.pipelines_tpv_reports_schema_rand)
          end
        end
      end

      context 'page' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipelines_tpv_reports_with_args('page:2')) }

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
          expect(response).to match_schema(ReportsSupport.pipelines_tpv_reports_schema_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            expect(pipelines['reports']['tpvReports']['pageInfo']['page']).to eq 2
          end
        end
      end

      context 'page_size' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipelines_tpv_reports_with_args('pageSize:5')) }

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
          expect(response).to match_schema(ReportsSupport.pipelines_tpv_reports_schema_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            expect(pipelines['reports']['tpvReports']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            expect(pipelines['reports']['tpvReports']['pageInfo']['pageSize']).to eq 5
          end
        end
      end

      context 'total_count' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipelines_tpv_reports(TpvReportDefinitions.tpv_report)) }

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
          expect(response).to match_schema(ReportsSupport.pipelines_tpv_reports_schema_full)
        end
        it 'returns expected count for nodes' do
          JsonPath.on(response[:json], '$..["tpvReports"]').each do |data|
            expect(data['totalCount']).to be >= data['nodes'].count
          end
        end
      end

      context 'orderBy' do
        %w[ASC DESC].each do |direction|
          context 'direction - ' + direction do
            [CREATED_DATE: 'createdDate', NAME: 'name'].each do |value|
              value.each do |k, v|
                context 'field - ' + k.to_s do
                  let(:response) { Requests.graphql(TpvReportsQueries.pipelines_tpv_reports_with_args("orderBy: {field: #{k}, direction: #{direction}}")) }

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
                    expect(response).to match_schema(ReportsSupport.pipelines_tpv_reports_schema_full)
                  end
                  it 'returns ' + v + ' in ' + direction + ' order' do
                    response[:json]['data']['pipelines']['nodes'].each do |data|
                      if direction == 'ASC'
                        expect(JsonPath.on(data, '$..["reports"]["tpvReports"]["nodes"][*]["' + v + '"]').compact).to eq JsonPath.on(data, '$..["reports"]["tpvReports"]["nodes"][*]["' + v + '"]').compact.sort
                      elsif direction == 'DESC'
                        expect(JsonPath.on(data, '$..["reports"]["tpvReports"]["nodes"][*]["' + v + '"]').compact).to eq JsonPath.on(data, '$..["reports"]["tpvReports"]["nodes"][*]["' + v + '"]').compact.sort.reverse
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    context 'TpvReports via pipeline' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipeline_tpv_reports(TpvReportDefinitions.tpv_report)) }

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
          expect(response).to match_schema(ReportsSupport.pipeline_tpv_reports_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.rand_tpv_report, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvReportsQueries.pipeline_tpv_reports(TpvReportDefinitions.rand_tpv_report)) }

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
            expect(response).to match_schema(ReportsSupport.pipeline_tpv_reports_schema_rand)
          end
        end
      end

      context 'page' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipeline_tpv_reports_with_args('page:2')) }

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
          expect(response).to match_schema(ReportsSupport.pipeline_tpv_reports_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['pipeline']['reports']['tpvReports']['pageInfo']['page']).to eq 2
        end
      end

      context 'page_size' do
        let(:response) { Requests.graphql(TpvReportsQueries.pipeline_tpv_reports_with_args('pageSize:5')) }

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
          expect(response).to match_schema(ReportsSupport.pipeline_tpv_reports_schema_full)
        end
        it 'returns expected page_size in response' do
          expect(response[:json]['data']['pipeline']['reports']['tpvReports']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          expect(response[:json]['data']['pipeline']['reports']['tpvReports']['pageInfo']['pageSize']).to eq 5
        end
      end
    end

    context 'TpvReports via reports' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvReportsQueries.reports_tpv_reports(TpvReportDefinitions.tpv_report)) }

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
          expect(response).to match_schema(ReportsSupport.reports_tpv_reports_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvReportDefinitions.rand_tpv_report, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvReportsQueries.reports_tpv_reports(TpvReportDefinitions.rand_tpv_report)) }

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
            expect(response).to match_schema(ReportsSupport.reports_tpv_reports_schema_rand)
          end
        end
      end

      context 'page' do
        let(:response) { Requests.graphql(TpvReportsQueries.reports_tpv_reports_with_args('page:2')) }

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
          expect(response).to match_schema(ReportsSupport.reports_tpv_reports_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['reports']['tpvReports']['pageInfo']['page']).to eq 2
        end
      end

      context 'page_size' do
        let(:response) { Requests.graphql(TpvReportsQueries.reports_tpv_reports_with_args('pageSize:5')) }

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
          expect(response).to match_schema(ReportsSupport.reports_tpv_reports_schema_full)
        end
        it 'returns expected page_size in response' do
          expect(response[:json]['data']['reports']['tpvReports']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          expect(response[:json]['data']['reports']['tpvReports']['pageInfo']['pageSize']).to eq 5
        end
      end

      context 'search' do
        %w'"snáck" "snacking" "sna"'.each do |search|
          context 'search - ' + search do
            let(:response) { Requests.graphql(TpvReportsQueries.reports_tpv_reports_with_args('search: ' + search)) }

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
              expect(response).to match_schema(ReportsSupport.reports_tpv_reports_schema_full)
            end
            it 'returns tpvReports containing search string' do
              response[:json]['data']['reports']['tpvReports']['nodes'].each do |reports|
                expect(reports['name']).to include('Snack')
              end
            end
          end
        end
      end

      context 'filter' do
        let(:response) { Requests.graphql(TpvReportsQueries.reports_tpv_reports_with_filter('(id==\"' + GraphqlDataService.report_id_selector(0) + '\"||id==\"' + GraphqlDataService.report_id_selector(1) + '\")')) }

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
          expect(response).to match_schema(ReportsSupport.reports_tpv_reports_schema_full)
        end
        it 'returns expected page in pageInfo' do
          expect(JsonPath.on(response[:json], '$...["reports"]["tpvReports"]["nodes"][*]["id"]').sort).to eq [GraphqlDataService.report_id_selector(0), GraphqlDataService.report_id_selector(1)].sort
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvReportsQueries.invalid_field) }

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

    context 'invalid page size value' do
      let(:response) { Requests.graphql(TpvReportsQueries.invalid_page_size_value) }

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
      let(:response) { Requests.graphql(TpvReportsQueries.missing_required_sub_field) }

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

    context 'invalid order_by direction' do
      let(:response) { Requests.graphql(TpvReportsQueries.invalid_order_by_direction) }

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

    context 'invalid order_by field' do
      let(:response) { Requests.graphql(TpvReportsQueries.invalid_order_by_field) }

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
      let(:response) { Requests.graphql(TpvReportsQueries.invalid_field_with_sub_field) }

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



