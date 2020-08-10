require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module CreateMutationVariables
  class << self
    attr_accessor :single_step_pipeline, :single_step, :linked_step_pipeline, :linked_step
  end

  ###SINGLE STEP PIPELINE###

  @single_step_pipeline = {
    name: 'QATESTPIPELINE1',
    status: 'NEW',
    markets: [
      {
        id: 'Global',
        name: 'Global',
        query: 'true'
      }
    ],
    startDate: '2018-11-01',
    endDate: '2018-11-30'
  }

  @single_step = ['{"status":"ACTIVE","application":{"type":"s3","bucket":"bsinsights","path":"#{settings(\\"insights.spark.curation.jar\\")}"},"applicationClass":"com.blackswan.spark.CurationRunner","repositories":"https://nexus3.blackswan.com/repository/maven-public/","packages":["#{settings(\\"trie.package\\")}"],"config":{"filter":{"type":"HQL","query":"country=\"US\""},"exclusionFileType":"TRIE","exclusionFiles":[],"inclusionFileType":"TRIE","inclusionFiles":[],"enrichments":["sentiment","country","language"],"streamGroups":[],"streams":[]},"type":"DATA_CURATION","order":0,"inputs":[{"name":"default","uri":{"type":"s3","path":"parquet5","bucket":"bsdatalake-streams"}}],"outputs":[{"name":"default","uri":{"type":"s3","path":"#{\\"final_datasets/job=\\" + pipelineId + \\"/step=\\" + stepId}","bucket":"bsinsights"}}],"id":"new_step_temp_0"}']

  ###LINKED STEP PIPELINE###

  @linked_step_pipeline = {
    name: 'QATESTPIPELINE2',
    status: 'NEW',
    markets: [
      {
        id: 'Global',
        name: 'Global',
        query: 'true'
      }
    ],
    startDate: '2018-11-01',
    endDate: '2018-11-30'
  }

  @linked_step = ['{"id":"1","type":"DATA_CURATION","status":"ACTIVE","order":0,"inputs":[{"name":"default","uri":{"type":"s3","path":"#{settings(\\"insights.spark.coldstorage.path\\")}","bucket":"#{settings(\\"insights.spark.coldstorage.bucket\\")}"}}],"outputs":[{"name":"default","uri":{"type":"s3","path":"#{\\"final_datasets/job=\\" + pipelineId + \\"/step=\\" + stepId}","bucket":"bsinsights"}}],"repositories":"#{settings(\\"insights.spark.dependency.repo\\")}","packages":["#{settings(\\"trie.package\\")}"],"applicationClass":"com.blackswan.spark.CurationRunner","application":{"type":"s3","path":"#{settings(\\"insights.spark.curation.jar\\")}","bucket":"bsinsights"},"config":{"exclusionFiles":[],"inclusionFileType":"TRIE","streams":[],"inclusionFiles":[],"exclusionFileType":"TRIE","enrichments":["sentiment","country","language"]}}', '{"status":"ACTIVE","application":{"type":"s3","path":"#{settings(\\"insights.spark.curation.jar\\")}","bucket":"bsinsights"},"applicationClass":"com.blackswan.spark.TaxonomyCurationRunner","repositories":"#{settings(\\"insights.spark.dependency.repo\\")}","packages":["#{settings(\\"trie.package\\")}"],"config":{"taxonomyFileType":"TRIE","taxonomyFile":{"type":"s3","bucket":"bsinsights","path":"insights-api/uploads/blackswan-live/TAXONOMY/130718_7ELEVEN.trie.json","format":"parquet"}},"id":"2","type":"TAXONOMY_CURATION","order":1,"inputs":[{"name":"default","stepId":"1","outputName":"default"}],"outputs":[{"name":"default","uri":{"type":"s3","path":"#{\\"taxonomy/job=\\" + pipelineId + \\"/step=\\" + stepId}","bucket":"bsinsights"}}]}']

end