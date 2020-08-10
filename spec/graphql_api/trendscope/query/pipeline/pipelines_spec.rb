require './spec/graphql_api/trendscope/query/pipeline/support/pipelines_queries'
require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/query/pipeline/support/support'

describe 'pipelines' do
  context 'positive tests' do
    context 'all fields' do
      let(:response) { Requests.graphql(PipelinesQueries.pipelines_query(PipelineDefinitions.pipeline)) }
      
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
        expect(response).to match_schema(PipelineSupport.pipelines_schema_full)
      end
    end
    
    context 'randomised fields' do
      context 'fields - ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.rand_pipeline, :property_name).join(', ') do
        let(:response) { Requests.graphql(PipelinesQueries.pipelines_query(PipelineDefinitions.rand_pipeline)) }
        
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
          expect(response).to match_schema(PipelineSupport.pipelines_schema_rand)
        end
      end
    end
    
    context 'page' do
      let(:response) { Requests.graphql(PipelinesQueries.pipelines_with_args(PipelineDefinitions.rand_pipeline, 'page:2')) }
      
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
        expect(response).to match_schema(PipelineSupport.pipelines_schema_rand)
      end
      it 'returns expected page in pageInfo' do
        expect(response[:json]['data']['pipelines']['pageInfo']['page']).to eq 2
      end
    end
    
    context 'page_size' do
      let(:response) { Requests.graphql(PipelinesQueries.pipelines_with_args(PipelineDefinitions.rand_pipeline, 'pageSize:5')) }
      
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
        expect(response).to match_schema(PipelineSupport.pipelines_schema_rand)
      end
      it 'returns expected page_size in response' do
        expect(response[:json]['data']['pipelines']['nodes'].count).to be <= 5
      end
      it 'returns expected page_size in pageInfo' do
        expect(response[:json]['data']['pipelines']['pageInfo']['pageSize']).to eq 5
      end
    end
    
    context 'total_count' do
      let(:response) { Requests.graphql(PipelinesQueries.pipelines_query(PipelineDefinitions.rand_pipeline)) }
      
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
        expect(response).to match_schema(PipelineSupport.pipelines_schema_rand)
      end
      it 'returns expected count for nodes' do
        expect(response[:json]['data']['pipelines']['totalCount']).to be >= response[:json]['data']['pipelines']['nodes'].count
      end
    end
    
    context 'orderBy' do
      %w[ASC DESC].each do |direction|
        context 'direction - ' + direction do
          [CREATED_DATE: 'createdDate', LAST_MODIFIED_DATE: 'lastModifiedDate', START_DATE: 'startDate', END_DATE: 'endDate'].each do |value|
            value.each do |k, v|
              context 'field - ' + k.to_s do
                let(:response) { Requests.graphql(PipelinesQueries.pipelines_with_args(PipelineDefinitions.pipeline, "orderBy: {field: #{k}, direction: #{direction}}")) }
                let(:nodes) { JsonPath.on(response[:json], '$..pipelines.nodes[*]' + v + '') }
                
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
                  expect(response).to match_schema(PipelineSupport.pipelines_schema_full)
                end
                it 'returns ' + v + ' in ' + direction + ' order' do
                  if direction == 'ASC'
                    expect(nodes.compact).to eq nodes.compact.sort
                  elsif direction == 'DESC'
                    expect(nodes.compact).to eq nodes.compact.sort.reverse
                  end
                end
              end
            end
          end
        end
      end
    end
    
    context 'search' do
      %w'"snáck" "snacking" "sna"'.each do |search|
        context 'search - ' + search do
          let(:response) { Requests.graphql(PipelinesQueries.pipelines_with_args(PipelineDefinitions.pipeline, 'search: ' + search)) }
          
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
            expect(response).to match_schema(PipelineSupport.pipelines_schema_full)
          end
          it 'returns pipelines containing search string' do
            response[:json]['data']['pipelines']['nodes'].each do |pipelines|
              expect(pipelines['name'].downcase).to include('snacking')
            end
          end
        end
      end
    end
    
    
    context 'filter' do
      let(:response) { Requests.graphql(PipelinesQueries.pipelines_with_filter('(id==\"' + GraphqlDataService.pipeline_id_selector(0) + '\"||id==\"' + GraphqlDataService.pipeline_id_selector(1) + '\")')) }
      
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
        expect(response).to match_schema(PipelineSupport.pipelines_schema_full)
      end
      it 'returns expected page in pageInfo' do
        expect(JsonPath.on(response[:json], '$...["pipelines"]["nodes"][*]["id"]').sort).to eq [GraphqlDataService.pipeline_id_selector(0), GraphqlDataService.pipeline_id_selector(1)].sort
      end
    end
  end
  
  context 'negative tests' do
    context 'invalid field' do
      let(:response) { Requests.graphql(PipelinesQueries.invalid_field) }
      
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
    
    context 'invalid search value' do
      let(:response) { Requests.graphql(PipelinesQueries.invalid_search_value) }
      
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
    
    context 'invalid page value' do
      let(:response) { Requests.graphql(PipelinesQueries.invalid_page_value) }
      
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
    
    context 'invalid page_size value' do
      let(:response) { Requests.graphql(PipelinesQueries.invalid_page_size_value) }
      
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
      let(:response) { Requests.graphql(PipelinesQueries.invalid_order_by_direction) }
      
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
      let(:response) { Requests.graphql(PipelinesQueries.invalid_order_by_field) }
      
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
      let(:response) { Requests.graphql(PipelinesQueries.missing_required_sub_field) }
      
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
      let(:response) { Requests.graphql(PipelinesQueries.invalid_field_with_sub_field) }
      
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
