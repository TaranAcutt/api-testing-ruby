require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/step_definitions_definitions'

describe 'step_definitions_field_validity' do
  context 'step_definitions' do
    let(:local) { GraphqlHelpers.local_fields(StepDefinitionsDefinitions.step_definitions).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('StepDefinition', 'fields').sort}

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'field_permissions' do
    let(:local) { GraphqlHelpers.local_fields(StepDefinitionsDefinitions.field_permissions).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('FieldPermission', 'fields').sort}
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

