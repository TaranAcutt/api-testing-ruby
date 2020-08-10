require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/reference_data_definitions'

describe 'reference_data_field_validity' do
  context 'permission' do
    let(:local) { GraphqlHelpers.local_fields(ReferenceDataDefinitions.permission_levels).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('PermissionLevel', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'tpv_phase' do
    let(:local) { GraphqlHelpers.local_fields(ReferenceDataDefinitions.tpv_phases).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvPhase', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

