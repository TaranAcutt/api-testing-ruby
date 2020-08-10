require './spec/graphql_api/trendscope/query/tpv_metric/support/tpv_meta_queries'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/query/tpv_metric/support/support'

describe 'tpv_meta' do
  context 'positive tests' do
    context 'meta via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetaQueries.pipelines_runs_tpv_meta(TpvMetricDefinitions.meta)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_meta_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_meta, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetaQueries.pipelines_runs_tpv_meta(TpvMetricDefinitions.rand_meta)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_meta_schema_rand)
          end
        end
      end
    end

    context 'meta via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetaQueries.pipelines_run_tpv_meta(TpvMetricDefinitions.meta)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_meta_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_meta, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetaQueries.pipelines_run_tpv_meta(TpvMetricDefinitions.rand_meta)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_meta_schema_rand)
          end
        end
      end
    end

    context 'meta via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetaQueries.pipelines_last_run_tpv_meta(TpvMetricDefinitions.meta)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_meta_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_meta, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetaQueries.pipelines_last_run_tpv_meta(TpvMetricDefinitions.rand_meta)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_meta_schema_rand)
          end
        end
      end
    end

    context 'meta via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetaQueries.pipeline_runs_tpv_meta(TpvMetricDefinitions.meta)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_meta_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_meta, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetaQueries.pipeline_runs_tpv_meta(TpvMetricDefinitions.rand_meta)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_meta_schema_rand)
          end
        end
      end
    end

    context 'meta via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetaQueries.pipeline_run_tpv_meta(TpvMetricDefinitions.meta)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_meta_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_meta, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetaQueries.pipeline_run_tpv_meta(TpvMetricDefinitions.rand_meta)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_meta_schema_rand)
          end
        end
      end
    end

    context 'meta via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetaQueries.pipeline_last_run_tpv_meta(TpvMetricDefinitions.meta)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_meta_schema_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_meta, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetaQueries.pipeline_last_run_tpv_meta(TpvMetricDefinitions.rand_meta)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_meta_schema_rand)
          end
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvMetaQueries.invalid_field) }

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
      let(:response) { Requests.graphql(TpvMetaQueries.invalid_field_with_sub_field) }

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



