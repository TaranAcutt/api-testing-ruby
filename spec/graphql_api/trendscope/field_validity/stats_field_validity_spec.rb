require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/stats_definitions'

describe 'stats_field_validity' do
  context 'stats' do
    let(:local) { GraphqlHelpers.local_fields(StatsDefinitions.stats).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Stats', 'fields').sort }
    
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'mongo_disk_space' do
    let(:local) { GraphqlHelpers.local_fields(StatsDefinitions.mongo_disk_space).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('MongoDiskSpace', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_step_times' do
    let(:local) { GraphqlHelpers.local_fields(StatsDefinitions.pipeline_step_times).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PipelineStepTimes', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end
