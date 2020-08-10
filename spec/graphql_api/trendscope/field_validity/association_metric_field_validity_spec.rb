require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

describe 'association_metric_field_validity' do
  context 'association_metric' do
    let(:local) { GraphqlHelpers.local_fields(AssocMetricDefinitions.association_metric).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('AssociationMetric', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'association' do
    let(:local) { GraphqlHelpers.local_fields(AssocMetricDefinitions.association).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Association', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'associated' do
    let(:local) { GraphqlHelpers.local_fields(AssocMetricDefinitions.associated).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('Associated', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'association_count' do
    let(:local) { GraphqlHelpers.local_fields(AssocMetricDefinitions.association_count).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('AssociationCount', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end
