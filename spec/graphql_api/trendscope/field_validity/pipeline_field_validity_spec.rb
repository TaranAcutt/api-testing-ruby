require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/pipeline_definitions'

describe 'pipeline_field_validity' do
  context 'pipeline' do
    let(:local) { GraphqlHelpers.local_fields(PipelineDefinitions.pipeline).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Pipeline', 'fields').sort }
    
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_revision' do
    let(:local) { GraphqlHelpers.local_fields(PipelineDefinitions.pipeline_revision).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PipelineRevision', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_revision' do
    let(:local) { GraphqlHelpers.local_fields(PipelineDefinitions.pipeline_revision_log).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PipelineRevisionLog', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_revision_value' do
    let(:local) { GraphqlHelpers.local_fields(PipelineDefinitions.pipeline_revision_value).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PipelineRevisionValue', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end
