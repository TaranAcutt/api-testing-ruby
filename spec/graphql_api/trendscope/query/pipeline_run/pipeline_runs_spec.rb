require './spec/graphql_api/trendscope/query/pipeline_run/support/pipeline_runs_queries'
require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'
require './spec/graphql_api/trendscope/query/pipeline_run/support/support'

describe 'pipeline_run - runs' do
  context 'positive tests' do
    context 'pipelineRun via pipelines' do
      context 'all fields' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipelines_runs_query(PipelineRunDefinitions.pipeline_run)) }

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
          expect(response).to match_schema(PipelineRunSupport.pipelines_runs_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(PipelineRunDefinitions.rand_pipeline_run, :property_name).join(', ') do
          let(:response) { Requests.graphql(PipelineRunsQueries.pipelines_runs_query(PipelineRunDefinitions.rand_pipeline_run)) }

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
            expect(response).to match_schema(PipelineRunSupport.pipelines_runs_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipelines_runs_with_args('page:2')) }

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
          expect(response).to match_schema(PipelineRunSupport.pipelines_runs_schema_full)
        end
        it 'returns expected page in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            expect(pipelines['runs']['pageInfo']['page']).to eq 2
          end
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipelines_runs_with_args('pageSize:5')) }

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
          expect(response).to match_schema(PipelineRunSupport.pipelines_runs_schema_full)
        end
        it 'returns expected page_size in response' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            expect(pipelines['runs']['nodes'].count).to be <= 5
          end
        end
        it 'returns expected page_size in pageInfo' do
          response[:json]['data']['pipelines']['nodes'].each do |pipelines|
            expect(pipelines['runs']['pageInfo']['pageSize']).to eq 5
          end
        end
      end
      
      context 'total_count' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipelines_runs_query(PipelineRunDefinitions.pipeline_run)) }

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
          expect(response).to match_schema(PipelineRunSupport.pipelines_runs_schema_full)
        end
        it 'returns expected count for nodes' do
          JsonPath.on(response[:json], '$..["runs"]').each do |data|
            expect(data['totalCount']).to be >= data['nodes'].count
          end
        end
      end
      
      context 'orderBy' do
        %w[ASC DESC].each do |direction|
          context 'direction - ' + direction do
            [CREATED_DATETIME: 'createdDate', START_DATE: 'startDate', END_DATE: 'endDate'].each do |value|
              value.each do |k, v|
                context 'field - ' + k.to_s do
                  let(:response) { Requests.graphql(PipelineRunsQueries.pipelines_runs_with_args("orderBy: {field: #{k}, direction: #{direction} }")) }

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
                    expect(response).to match_schema(PipelineRunSupport.pipelines_runs_schema_full)
                  end
                  it 'returns ' + v + ' in ' + direction + ' order' do
                    response[:json]['data']['pipelines']['nodes'].each do |data|
                      if direction == 'ASC'
                        expect(JsonPath.on(JsonPath.on(data, '$..["runs"]["nodes"][*]'), '$..["' + v + '"]').compact).to eq JsonPath.on(JsonPath.on(data, '$..["runs"]["nodes"][*]'), '$..["' + v + '"]').compact.sort
                      elsif direction == 'DESC'
                        expect(JsonPath.on(JsonPath.on(data, '$..["runs"]["nodes"][*]'), '$..["' + v + '"]').compact).to eq JsonPath.on(JsonPath.on(data, '$..["runs"]["nodes"][*]'), '$..["' + v + '"]').compact.sort.reverse
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
    
    context 'pipelineRun via pipeline' do
      context 'all fields' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipeline_runs_query(PipelineRunDefinitions.pipeline_run)) }

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
          expect(response).to match_schema(PipelineRunSupport.pipeline_runs_schema_full)
        end
      end
      
      context 'randomised fields' do
        context 'fields - ' + GraphqlHelpers.filtered_definitions(PipelineRunDefinitions.rand_pipeline_run, :property_name).join(', ') do
          let(:response) { Requests.graphql(PipelineRunsQueries.pipeline_runs_query(PipelineRunDefinitions.rand_pipeline_run)) }

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
            expect(response).to match_schema(PipelineRunSupport.pipeline_runs_schema_rand)
          end
        end
      end
      
      context 'page' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipeline_runs_query_with_args('page:2')) }

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
          expect(response).to match_schema(PipelineRunSupport.pipeline_runs_schema_rand)
        end
        it 'returns expected page in pageInfo' do
          expect(response[:json]['data']['pipeline']['runs']['pageInfo']['page']).to eq 2
        end
      end
      
      context 'page_size' do
        let(:response) { Requests.graphql(PipelineRunsQueries.pipeline_runs_query_with_args('pageSize:5')) }

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
          expect(response).to match_schema(PipelineRunSupport.pipeline_runs_schema_rand)
        end
        it 'returns expected page_size in response' do
          expect(response[:json]['data']['pipeline']['runs']['nodes'].count).to be <= 5
        end
        it 'returns expected page_size in pageInfo' do
          expect(response[:json]['data']['pipeline']['runs']['pageInfo']['pageSize']).to eq 5
        end
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelineRunsQueries.invalid_field) }

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
    
    context 'invalid "first" value' do
      let(:response) { Requests.graphql(PipelineRunsQueries.invalid_first_value) }

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
      let(:response) { Requests.graphql(PipelineRunsQueries.missing_required_sub_field) }

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
      let(:response) { Requests.graphql(PipelineRunsQueries.invalid_field_with_sub_field) }

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
      let(:response) { Requests.graphql(PipelineRunsQueries.invalid_order_by_direction) }

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
      let(:response) { Requests.graphql(PipelineRunsQueries.invalid_order_by_field) }

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