require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/streams_definitions'

describe 'stream_groups_field_validity' do
  context 'stream_group' do
    let(:local) { GraphqlHelpers.local_fields(StreamsDefinitions.stream_groups).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('StreamGroupSimple', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end

