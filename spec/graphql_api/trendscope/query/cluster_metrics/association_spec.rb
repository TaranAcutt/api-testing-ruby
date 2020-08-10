require './spec/graphql_api/trendscope/query/association_metric/support/assoc_metrics_queries'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'
require './spec/graphql_api/trendscope/query/association_metric/support/assoc_metrics_schema'

describe 'association' do
  context 'positive tests' do
    context 'metrics via pipelines > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_rand)
          end
        end
      end
    end
    
    context 'metrics via pipelines > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_run_assoc_metrics_schema_rand)
          end
        end
      end
    end
    
    context 'metrics via pipelines > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_last_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipelines_last_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_last_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipelines_last_run_assoc_metrics_schema_rand)
          end
        end
      end
    end
    
    context 'metrics via pipeline > runs' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_runs_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_runs_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_runs_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipeline_runs_assoc_metrics_schema_rand)
          end
        end
      end
    end
    
    context 'metrics via pipeline > run' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipeline_run_assoc_metrics_schema_rand)
          end
        end
      end
    end
    
    context 'metrics via pipeline > lastRun' do
      context 'all fields' do
        let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_last_run_assoc_metrics(AssocMetricDefinitions.association_metric)) }

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
          expect(response).to match_schema(AssocMetricsSchema.pipeline_last_run_assoc_metrics_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(AssocMetricDefinitions.rand_association_metric, :property_name).join(', ') do
          let(:response) { Requests.graphql(AssocMetricsQueries.pipeline_last_run_assoc_metrics(AssocMetricDefinitions.rand_association_metric)) }

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
            expect(response).to match_schema(AssocMetricsSchema.pipeline_last_run_assoc_metrics_schema_rand)
          end
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_page_size_value) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_order_by_direction) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_order_by_field) }

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
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_field_with_sub_field) }

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
    
    context 'invalid filter' do
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_filter) }

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
    
    context '^= with invalid filter value' do
      let(:response) { Requests.graphql(AssocMetricsQueries.pipelines_runs_assoc_with_args('filter: "(subLens^=\"-a-z\")"')) }

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
        expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
      end
    end
    
    context 'invalid operator' do
      let(:response) { Requests.graphql(AssocMetricsQueries.invalid_operator) }

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
        expect(response).to match_schema(AssocMetricsSchema.pipelines_runs_assoc_metrics_schema_full)
      end
    end
  end
end
