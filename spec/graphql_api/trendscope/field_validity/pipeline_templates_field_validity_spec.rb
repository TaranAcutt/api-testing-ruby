require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/pipeline_templates_definitions'

describe 'pipeline_template_field_validity' do
  context 'step_template' do
    let(:local) { GraphqlHelpers.local_fields(PipelineTemplatesDefinitions.step_template).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('StepTemplate', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_template_defaults' do
    let(:local) { GraphqlHelpers.local_fields(PipelineTemplatesDefinitions.pipeline_template_defaults).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PipelineTemplateDefaults', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_template' do
    let(:local) { GraphqlHelpers.local_fields(PipelineTemplatesDefinitions.pipeline_templates).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PipelineTemplate', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

