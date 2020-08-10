require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/volume_metric_definitions'

describe 'volume_metrics_field_validity' do
  let(:local)  { GraphqlHelpers.local_fields(VolumeMetricDefinitions.volume_metric).sort }
  let(:schema) { GraphqlHelpers.graphql_schema_data('VolumeMetric', 'fields').sort }

  it 'returns fields from schema matching local' do
    expect(local).to match(schema)
  end
end

