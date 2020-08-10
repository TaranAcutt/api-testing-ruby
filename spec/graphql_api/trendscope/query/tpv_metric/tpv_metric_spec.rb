require './spec/graphql_api/trendscope/query/tpv_metric/support/tpv_metric_queries'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'
require './spec/graphql_api/trendscope/query/tpv_metric/support/support'

describe 'tpv_metric' do
  context 'positive tests' do
    context 'metric via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricQueries.pipelines_runs_tpv_metric(TpvMetricDefinitions.tpv_metric)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricQueries.pipelines_runs_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipelines_runs_tpv_metric_rand)
          end
        end
      end
    end

    context 'metric via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricQueries.pipelines_run_tpv_metric(TpvMetricDefinitions.tpv_metric)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricQueries.pipelines_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipelines_run_tpv_metric_rand)
          end
        end
      end
    end

    context 'metric via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricQueries.pipelines_last_run_tpv_metric(TpvMetricDefinitions.tpv_metric)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricQueries.pipelines_last_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipelines_last_run_tpv_metric_rand)
          end
        end
      end
    end

    context 'metric via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricQueries.pipeline_runs_tpv_metric(TpvMetricDefinitions.tpv_metric)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricQueries.pipeline_runs_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipeline_runs_tpv_metric_rand)
          end
        end
      end
    end

    context 'metric via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricQueries.pipeline_run_tpv_metric(TpvMetricDefinitions.tpv_metric)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricQueries.pipeline_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipeline_run_tpv_metric_rand)
          end
        end
      end
    end

    context 'metric via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(TpvMetricQueries.pipeline_last_run_tpv_metric(TpvMetricDefinitions.tpv_metric)) }

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
          expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(TpvMetricDefinitions.rand_tpv_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(TpvMetricQueries.pipeline_last_run_tpv_metric(TpvMetricDefinitions.rand_tpv_metric)) }

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
            expect(response).to match_schema(TpvMetricSupport.pipeline_last_run_tpv_metric_rand)
          end
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(TpvMetricQueries.invalid_field) }

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

    context 'invalid argument' do
      let(:response) { Requests.graphql(TpvMetricQueries.invalid_argument) }

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

    context 'missing required argument' do
      let(:response) { Requests.graphql(TpvMetricQueries.missing_required_argument) }

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

    context 'missing required sub field' do
      let(:response) { Requests.graphql(TpvMetricQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(TpvMetricQueries.invalid_field_with_sub_field) }

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
