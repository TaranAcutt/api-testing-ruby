require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/pipeline_run_definitions'

describe 'pipeline_run_field_validity' do
  context 'pipeline_run' do
    let(:local) {GraphqlHelpers.local_fields(PipelineRunDefinitions.pipeline_run).sort}
    let(:schema) {GraphqlHelpers.graphql_schema_data('PipelineRun', 'fields').sort}

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_run_step' do
    let(:local) {(GraphqlHelpers.local_fields(PipelineRunDefinitions.pipeline_run_step)  << 'logs').sort}
    let(:schema) {GraphqlHelpers.graphql_schema_data('PipelineRunStep', 'fields').sort}

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_run_step_list_item' do
    let(:local) {GraphqlHelpers.local_fields(PipelineRunDefinitions.pipeline_run_step_list_item).sort}
    let(:schema) {GraphqlHelpers.graphql_schema_data('PipelineRunStepListItem', 'fields').sort}

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end

  context 'pipeline_run_step_logs' do
    let(:local) {GraphqlHelpers.local_fields(PipelineRunDefinitions.pipeline_run_step_logs).sort}
    let(:schema) {GraphqlHelpers.graphql_schema_data('PipelineRunStepLogs', 'fields').sort}

    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
  
  context 'step_meta_data_metric' do
    let(:local) {GraphqlHelpers.local_fields(PipelineRunDefinitions.step_meta_data_metric).sort}
    let(:schema) {GraphqlHelpers.graphql_schema_data('StepMetaDataMetric', 'fields').sort}
  
    it 'returns fields from schema matching local' do
      expect(local).to match(schema)
    end
  end
end
