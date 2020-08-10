require './spec/graphql_api/trendscope/support/common_schema'

module SharedExamples
  
  shared_examples 'successful request' do
    it 'returns OK (200) status code' do
      expect(response[:raw].code).to eq 200
    end
    
    it 'returns expected content_type' do
      expect(response[:raw].headers[:content_type]).to start_with 'application/json'
    end
    
    it 'returns a response without errors' do
      if response[:json]['errors']
        response[:json]['errors'].each do |error|
          unless [
            'Can\'t find successful run for pipeline',
            'No association mappings set for report:',
            'Cannot find association mapping for:',
            'Missing trendMetrics on subLens:',
            'Report not found with id:',
            'Failed to get mongo database usage stats',
            'Cannot return null for non-nullable type: \'ISO8601DateOnly\' within parent',
            'Entity \'Revision: 0\' not found',
            'Missing trendMetrics on cluster:'
          ].each do |message|
            message.include? error['message']
          end
            expect(response[:json]['errors']).to be_nil
          end
        end
      end
    end
    
    it 'response conforms to local schema' do
      expect(response[:json]).to match_schema(schema)
    end
  end
  
  shared_examples 'it returns 200 status code' do |thing|
    let(:response) {thing}
    it 'returns OK (200) status code' do
      expect(response[:raw].code).to eq 200
    end
  end
  
  shared_examples 'successful request without schema' do
    it 'returns OK (200) status code' do
      expect(response[:raw].code).to eq 200
    end
    
    it 'returns expected content_type' do
      expect(response[:raw].headers[:content_type]).to start_with 'application/json'
    end
    
    it 'returns a response without errors' do
      if response[:json]['errors']
        response[:json]['errors'].each do |error|
          unless [
            'Can\'t find successful run for pipeline',
            'No association mappings set for report:',
            'Cannot find association mapping for:',
            'Missing trendMetrics on subLens:',
            'Report not found with id:',
            'Failed to get mongo database usage stats',
            'Cannot return null for non-nullable type: \'ISO8601DateOnly\' within parent',
            'Entity \'Revision: 0\' not found',
            'Missing trendMetrics on cluster:'
          ].each do |message|
            message.include? error['message']
          end
            expect(response[:json]['errors']).to be_nil
          end
        end
      end
    end
  end
  
  shared_examples 'graphql BadRequest response' do
    it 'returns BadRequest (400) status code' do
      expect(response[:raw].code).to eq 400
    end
    
    it 'returns content_type json' do
      expect(response[:raw].headers[:content_type]).to start_with 'application/json'
    end
    
    it 'returns response matching error schema' do
      expect(response[:json]['errors']).to match_schema(CommonSchema.graphql_error_schema)
    end
  end
  
  shared_examples 'pipeline_deleted_by_id' do
    it 'returns 200 for delete request' do
      expect(delete.code).to eq 200
    end
    
    it 'returns expected schema for delete request' do
      expect(delete).to match_schema(delete_schema)
    end
    
    it 'returns a delete response without errors' do
      if delete['errors']
        delete['errors'].each do |error|
          unless error['message'].include? "Can't find successful run for pipeline"
            expect(delete['errors']).to be_nil
          end
        end
      end
    end
  end
end