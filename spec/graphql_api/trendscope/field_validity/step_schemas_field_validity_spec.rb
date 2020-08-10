require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/step_schemas_definitions'

describe 'step_schemas_field_validity' do
  context 'step_schemas' do
    let(:local) { GraphqlHelpers.local_fields(StepSchemasDefinitions.step_schemas).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('StepSchema', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

