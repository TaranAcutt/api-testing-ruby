require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/streams_definitions'

describe 'streams_field_validity' do
  context 'streams' do
    let(:local) { GraphqlHelpers.local_fields(StreamsDefinitions.stream).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Stream', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

