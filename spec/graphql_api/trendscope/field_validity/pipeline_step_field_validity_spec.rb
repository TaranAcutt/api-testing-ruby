require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/step_definitions'

describe 'pipeline_step_field_validity' do
  context 'generic_pipeline_step' do
    let(:local) { GraphqlHelpers.local_fields(StepDefinitions.step).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Step', 'fields').sort}

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

