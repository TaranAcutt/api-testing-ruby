require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'

describe 'tpv_report_field_validity' do
  context 'tpv_report' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.tpv_report).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('TpvReport', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'language_name' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.language_name).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('LanguageName', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'report_meta_data' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.report_meta_data).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('ReportMetaData', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'report_association_mapping' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.report_association_mapping).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('ReportAssociationMapping', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'market_pipeline_mapping' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.market_pipeline_mapping).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('MarketPipelineMapping', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'market_taxonomy_mapping' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.market_taxonomy_mapping).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('MarketTaxonomyMapping', 'fields').sort }
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
  
  context 'report_section_taxonomies' do
    let(:local) { GraphqlHelpers.local_fields(TpvReportDefinitions.report_section_taxonomies).sort }
    let(:schema) { GraphqlHelpers.graphql_schema_data('ReportSectionTaxonomies', 'fields').sort }

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end
