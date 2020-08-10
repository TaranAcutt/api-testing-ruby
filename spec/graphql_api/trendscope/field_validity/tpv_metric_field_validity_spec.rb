require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/tpv_metric_definitions'

describe 'tpv_metrics_field_validity' do
  context 'tpv_metric' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.tpv_metric).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvMetric', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'overview' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.overview).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvMetricOverview', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'tpv_demographics_category' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.tpv_demographics_category).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvDemographicsCategory', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'tpv_demographics_metric' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.tpv_demographics_metric).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvDemographicsMetric', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'tpv_demographics_metrics' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.tpv_demographics_metrics).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvDemographicsMetrics', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'cluster' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.cluster).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Cluster', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'trend_metrics' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.trend_metrics).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TrendMetrics', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'meta' do
    let(:local) { GraphqlHelpers.local_fields(TpvMetricDefinitions.meta).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TrendMetricsMeta', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end
