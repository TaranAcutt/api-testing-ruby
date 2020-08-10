require './spec/graphql_api/trendscope/query/volume_metric/support/volume_metric_queries'
require './spec/graphql_api/trendscope/definitions/volume_metric_definitions'
require './spec/graphql_api/trendscope/query/volume_metric/support/support'


describe 'volume_metric' do
  context 'positive tests' do
    context 'metric via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(VolumeMetricQueries.pipelines_runs_volume_metric(VolumeMetricDefinitions.volume_metric)) }

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
          expect(response).to match_schema(VolumeMetricSupport.pipelines_runs_volume_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(VolumeMetricDefinitions.rand_volume_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(VolumeMetricQueries.pipelines_runs_volume_metric(VolumeMetricDefinitions.rand_volume_metric)) }

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
            expect(response).to match_schema(VolumeMetricSupport.pipelines_runs_volume_metric_rand)
          end
        end
      end
    end

    context 'metric via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(VolumeMetricQueries.pipelines_run_volume_metric(VolumeMetricDefinitions.volume_metric)) }

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
          expect(response).to match_schema(VolumeMetricSupport.pipelines_run_volume_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(VolumeMetricDefinitions.rand_volume_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(VolumeMetricQueries.pipelines_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)) }

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
            expect(response).to match_schema(VolumeMetricSupport.pipelines_run_volume_metric_rand)
          end
        end
      end
    end

    context 'metric via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(VolumeMetricQueries.pipelines_last_run_volume_metric(VolumeMetricDefinitions.volume_metric)) }

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
          expect(response).to match_schema(VolumeMetricSupport.pipelines_last_run_volume_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(VolumeMetricDefinitions.rand_volume_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(VolumeMetricQueries.pipelines_last_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)) }

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
            expect(response).to match_schema(VolumeMetricSupport.pipelines_last_run_volume_metric_rand)
          end
        end
      end
    end

    context 'metric via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(VolumeMetricQueries.pipeline_runs_volume_metric(VolumeMetricDefinitions.volume_metric)) }

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
          expect(response).to match_schema(VolumeMetricSupport.pipeline_runs_volume_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(VolumeMetricDefinitions.rand_volume_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(VolumeMetricQueries.pipeline_runs_volume_metric(VolumeMetricDefinitions.rand_volume_metric)) }

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
            expect(response).to match_schema(VolumeMetricSupport.pipeline_runs_volume_metric_rand)
          end
        end
      end
    end

    context 'metric via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(VolumeMetricQueries.pipeline_run_volume_metric(VolumeMetricDefinitions.volume_metric)) }

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
          expect(response).to match_schema(VolumeMetricSupport.pipeline_run_volume_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(VolumeMetricDefinitions.rand_volume_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(VolumeMetricQueries.pipeline_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)) }

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
            expect(response).to match_schema(VolumeMetricSupport.pipeline_run_volume_metric_rand)
          end
        end
      end
    end

    context 'metric via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(VolumeMetricQueries.pipeline_last_run_volume_metric(VolumeMetricDefinitions.volume_metric)) }

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
          expect(response).to match_schema(VolumeMetricSupport.pipeline_last_run_volume_metric_full)
        end
      end

      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(VolumeMetricDefinitions.rand_volume_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(VolumeMetricQueries.pipeline_last_run_volume_metric(VolumeMetricDefinitions.rand_volume_metric)) }

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
            expect(response).to match_schema(VolumeMetricSupport.pipeline_last_run_volume_metric_rand)
          end
        end
      end
    end
  end

  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(VolumeMetricQueries.invalid_field) }

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

    context 'invalid argument type' do
      let(:response) { Requests.graphql(VolumeMetricQueries.invalid_arg_type) }

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
      let(:response) { Requests.graphql(VolumeMetricQueries.invalid_argument) }

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
      let(:response) { Requests.graphql(VolumeMetricQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(VolumeMetricQueries.missing_required_argument) }

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
      let(:response) { Requests.graphql(VolumeMetricQueries.invalid_field_with_sub_field) }

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



