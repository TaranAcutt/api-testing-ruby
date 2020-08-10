require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/demographics_metric_definitions'

describe 'demographics_metrics_field_validity' do
  context 'demographics_metrics' do
    let(:local) { GraphqlHelpers.local_fields(DemographicsMetricDefinitions.demographics_metrics) }
    let(:schema) { GraphqlHelpers.graphql_schema_data('DemographicsMetrics', 'fields') }

    it 'returns fields from schema matching local' do
      expect(local.sort).to match(schema.sort)
    end
  end

  context 'demographic_metric' do
    let(:local) { GraphqlHelpers.local_fields(DemographicsMetricDefinitions.demographic_metric) }
    let(:schema) { GraphqlHelpers.graphql_schema_data('DemographicsMetric', 'fields') }

    it 'returns fields from schema matching local' do
      expect(local.sort).to match(schema.sort)
    end
  end

  context 'demographic_category' do
    let(:local) { GraphqlHelpers.local_fields(DemographicsMetricDefinitions.demographic_category) }
    let(:schema) { GraphqlHelpers.graphql_schema_data('DemographicsCategory', 'fields') }

    it 'returns fields from schema matching local' do
      expect(local.sort).to match(schema.sort)
    end
  end
end

