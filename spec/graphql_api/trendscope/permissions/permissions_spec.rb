require './spec/graphql_api/trendscope/permissions/support/permissions_queries'
require './spec/graphql_api/trendscope/permissions/support/permissions_schema'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'

describe 'permissions' do
  before(:context) { Fixtures.create_permissions_fixtures }
  context 'pipeline_permissions' do
    context 'positive tests' do
      context 'project_controller - QAFIXTURES_USER1' do
        context 'pipeline by id' do
          context 'direct access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE1', PipelineDefinitions.pipeline)) }

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
              expect(response).to match_schema(PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline))
            end
            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE1')
            end
            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE1'
            end
          end

          context 'group access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE3', PipelineDefinitions.pipeline)) }

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
              expect(response).to match_schema(PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline))
            end
            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE3')
            end
            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE3'
            end
          end

          context 'organisation access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE5', PipelineDefinitions.pipeline)) }

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
              expect(response).to match_schema(PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline))
            end
            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE5')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE5'
            end
          end

          context 'organisation group access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE7', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline) }

            include_examples 'successful request'

            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE7')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE7'
            end
          end
        end

        context 'all pipelines' do
          let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
          let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_query(PipelineDefinitions.pipeline)) }
          let(:schema) { PermissionsSchema.pipelines_schema(PipelineDefinitions.pipeline) }

          include_examples 'successful request'

          it 'returns only expected ids' do
            expect(JsonPath.on(response[:json], '$["data"]["pipelines"]["nodes"][*]["id"]').sort).to eq [GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE1'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE3'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE5'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE7'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')].sort
          end

          it 'returns only expected names' do
            expect(JsonPath.on(response[:json], '$["data"]["pipelines"]["nodes"][*]["name"]').sort).to eq %w'QAFIXTURES_PIPELINE1 QAFIXTURES_PIPELINE3 QAFIXTURES_PIPELINE5 QAFIXTURES_PIPELINE7 QAFIXTURES_PIPELINE9'.sort
          end
        end

        context 'report by id' do
          context 'primary pipeline access to report' do
            let(:reports) { GraphqlDataService.permission_reports[:user1] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT1', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

            include_examples 'successful request'

            it 'returns expected report id' do
              expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT1')
            end

            it 'returns expected report name' do
              expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT1'
            end
          end

          context 'mapped pipeline and no primary pipeline access to report' do
            let(:reports) { GraphqlDataService.permission_reports[:user1] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT3', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

            include_examples 'successful request'

            it 'returns expected report id' do
              expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT3')
            end

            it 'returns expected report name' do
              expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT3'
            end
          end
        end

        context 'all reports' do
          let(:reports) { GraphqlDataService.permission_reports[:user1] }
          let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_query(TpvReportDefinitions.tpv_report)) }
          let(:schema) { PermissionsSchema.reports_tpv_reports_schema(TpvReportDefinitions.tpv_report) }

          include_examples 'successful request'

          it 'returns only expected ids' do
            expect(JsonPath.on(response[:json], '$["data"]["reports"]["tpvReports"]["nodes"][*]["id"]').sort).to eq [GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT1'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT3'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT5'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT7'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT9'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT11'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT13'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT15'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT17'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT19')].sort
          end

          it 'returns only expected names' do
            expect(JsonPath.on(response[:json], '$["data"]["reports"]["tpvReports"]["nodes"][*]["name"]').sort).to eq %w'QAFIXTURES_REPORT1 QAFIXTURES_REPORT3 QAFIXTURES_REPORT5 QAFIXTURES_REPORT7 QAFIXTURES_REPORT9 QAFIXTURES_REPORT11 QAFIXTURES_REPORT13 QAFIXTURES_REPORT15 QAFIXTURES_REPORT17 QAFIXTURES_REPORT19'.sort
          end
        end
      end

      context 'project_controller - QAFIXTURES_USER2' do
        context 'pipeline by id' do
          context 'direct access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE2', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline) }

            include_examples 'successful request'

            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE2')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE2'
            end
          end

          context 'group access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE4', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline) }

            include_examples 'successful request'

            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE4')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE4'
            end
          end

          context 'organisation access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE6', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline) }

            include_examples 'successful request'

            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE6')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE6'
            end
          end

          context 'organisation group access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE8', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.pipeline_schema(PipelineDefinitions.pipeline) }

            include_examples 'successful request'

            it 'returns expected pipeline id' do
              expect(response[:json]['data']['pipeline']['id']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE8')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['pipeline']['name']).to eq 'QAFIXTURES_PIPELINE8'
            end
          end
        end

        context 'all pipeline' do
          let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
          let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_query(PipelineDefinitions.pipeline)) }
          let(:schema) { PermissionsSchema.pipelines_schema(PipelineDefinitions.pipeline) }

          include_examples 'successful request'

          it 'returns only expected id' do
            expect(JsonPath.on(response[:json], '$["data"]["pipelines"]["nodes"][*]["id"]').sort).to eq [GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE2'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE4'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE6'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE8'), GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')].sort
          end

          it 'returns only expected name' do
            expect(JsonPath.on(response[:json], '$["data"]["pipelines"]["nodes"][*]["name"]').sort).to eq %w'QAFIXTURES_PIPELINE2 QAFIXTURES_PIPELINE4 QAFIXTURES_PIPELINE6 QAFIXTURES_PIPELINE8 QAFIXTURES_PIPELINE9'.sort
          end
        end

        context 'report by id' do
          context 'primary pipeline access to report' do
            let(:reports) { GraphqlDataService.permission_reports[:user2] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT2', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

            include_examples 'successful request'
            
            it 'returns expected pipeline id' do
              expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT2')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT2'
            end
          end

          context 'mapped pipeline and no primary pipeline access to report' do
            let(:reports) { GraphqlDataService.permission_reports[:user2] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT4', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

            include_examples 'successful request'
            
            it 'returns expected pipeline id' do
              expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT4')
            end

            it 'returns expected pipeline name' do
              expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT4'
            end
          end
        end

        context 'all reports' do
          let(:reports) { GraphqlDataService.permission_reports[:user2] }
          let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_query(TpvReportDefinitions.tpv_report)) }
          let(:schema) { PermissionsSchema.reports_tpv_reports_schema(TpvReportDefinitions.tpv_report) }

          include_examples 'successful request'

          it 'returns only expected ids' do
            expect(JsonPath.on(response[:json], '$["data"]["reports"]["tpvReports"]["nodes"][*]["id"]').sort).to eq [GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT2'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT4'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT6'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT8'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT10'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT12'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT14'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT16'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT18'), GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT20')].sort
          end

          it 'returns only expected names' do
            expect(JsonPath.on(response[:json], '$["data"]["reports"]["tpvReports"]["nodes"][*]["name"]').sort).to eq %w'QAFIXTURES_REPORT2 QAFIXTURES_REPORT4 QAFIXTURES_REPORT6 QAFIXTURES_REPORT8 QAFIXTURES_REPORT10 QAFIXTURES_REPORT12 QAFIXTURES_REPORT14 QAFIXTURES_REPORT16 QAFIXTURES_REPORT18 QAFIXTURES_REPORT20'.sort
          end
        end
      end
    end

    context 'negative tests' do
      context 'project_controller - QAFIXTURES_USER1' do
        context 'no access to user2 pipeline id' do
          context 'direct access to pipeline' do
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE2', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end

          context 'group access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser1 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE4', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end

          context 'organisation access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser1 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE6', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end

          context 'organisation group access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser1 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE8', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end
        end

        context 'no access to user2 report id' do
          context 'primary pipeline access to report' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser1 }
            let(:reports) { GraphqlDataService.permission_reports[:user2] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT2', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.invalid_report_schema }

            include_examples 'successful request'
          end

          context 'mapped pipeline and no primary pipeline access to report' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser1 }
            let(:reports) { GraphqlDataService.permission_reports[:user2] }
            let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT4', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.invalid_report_schema }

            include_examples 'successful request'
          end
        end
      end

      context 'project_controller - QAFIXTURES_USER2' do
        context 'no access to user1 pipeline id' do
          context 'direct access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser2 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE1', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end

          context 'group access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser2 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE3', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end

          context 'organisation access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser2 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE5', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end

          context 'organisation group access to pipeline' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser2 }
            let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.pipeline_permissions_by_id_query(pipelines, 'QAFIXTURES_PIPELINE7', PipelineDefinitions.pipeline)) }
            let(:schema) { PermissionsSchema.invalid_pipeline_schema }

            include_examples 'successful request'
          end
        end

        context 'no access to user1 report id' do
          context 'primary pipeline access to report' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser2 }
            let(:reports) { GraphqlDataService.permission_reports[:user1] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT1', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.invalid_report_schema }

            include_examples 'successful request'
          end

          context 'mapped pipeline and no primary pipeline access to report' do
            let(:auth) { GraphqlAuthTokens.qafixturesuser2 }
            let(:reports) { GraphqlDataService.permission_reports[:user1] }
            let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT3', TpvReportDefinitions.tpv_report)) }
            let(:schema) { PermissionsSchema.invalid_report_schema }

            include_examples 'successful request'
          end
        end
      end
    end
  end
  context 'reports_permissions' do
    context 'positive tests' do
      context 'project_controller - QAFIXTURES_USER1' do
        context 'report by id' do
          context 'pipeline' do
            context 'direct access to report' do
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT5', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT5')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT5'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT7', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT7')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT7'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT9', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT9')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT9'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT11', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT11')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT11'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end
          end

          context 'mapped pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT13', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT13')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT13'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT15', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT15')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT15'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT17', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT17')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT17'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT19', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT19')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT19'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end
          end
        end
      end

      context 'project_controller - QAFIXTURES_USER2' do
        context 'report by id' do
          context 'pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT6', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT6')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT6'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT8', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT8')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT8'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT10', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT10')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT10'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT12', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT12')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT12'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['pipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end
          end

          context 'mapped pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT14', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT14')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT14'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT16', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT16')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT16'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT18', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT18')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT18'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT20', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.reports_tpv_report_schema(TpvReportDefinitions.tpv_report) }

              include_examples 'successful request'

              it 'returns expected report id' do
                expect(response[:json]['data']['reports']['tpvReport']['id']).to eq GraphqlHelpers.report_by_name(reports, 'QAFIXTURES_REPORT20')
              end

              it 'returns expected report name' do
                expect(response[:json]['data']['reports']['tpvReport']['name']).to eq 'QAFIXTURES_REPORT20'
              end

              it 'returns expected pipeline id' do
                expect(response[:json]['data']['reports']['tpvReport']['marketPipelineMappings'][0]['targetPipelineId']).to eq GraphqlHelpers.pipeline_by_name(pipelines, 'QAFIXTURES_PIPELINE9')
              end
            end
          end
        end
      end
    end

    context 'negative tests' do
      context 'project_controller - QAFIXTURES_USER1' do
        context 'no access to user2 report id' do
          context 'pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT6', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT8', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT10', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT12', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end
          end

          context 'mapped pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT14', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT16', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT18', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user2] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user2] }
              let(:response) { Requests.graphql_user1(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT20', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end
          end
        end
      end

      context 'project_controller - QAFIXTURES_USER2' do
        context 'no access to user1 pipeline id' do
          context 'pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT5', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT7', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT9', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT11', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end
          end

          context 'mapped pipeline' do
            context 'direct access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT13', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT15', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT17', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end

            context 'organisation group access to report' do
              let(:reports) { GraphqlDataService.permission_reports[:user1] }
              let(:pipelines) { GraphqlDataService.permission_pipelines[:user1] }
              let(:response) { Requests.graphql_user2(PermissionsQueries.reports_permissions_by_id_query(reports, 'QAFIXTURES_REPORT19', TpvReportDefinitions.tpv_report)) }
              let(:schema) { PermissionsSchema.invalid_report_schema }

              include_examples 'successful request'
            end
          end
        end
      end
    end
  end
  after(:context) { Fixtures.delete_permissions_fixtures }
end