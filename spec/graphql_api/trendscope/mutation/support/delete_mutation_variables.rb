require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module DeleteMutationVariables
  class << self
    attr_accessor :pipeline, :steps
  end

  @pipeline = {
    name: 'QATESTPIPELINE3',
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

  @steps = ['{"status":"ACTIVE","application":{"type":"s3","bucket":"bsinsights","path":"#{settings(\\"insights.spark.curation.jar\\")}"},"applicationClass":"com.blackswan.spark.CurationRunner","repositories":"https://nexus3.blackswan.com/repository/maven-public/","packages":["#{settings(\\"trie.package\\")}"],"config":{"exclusionFileType":"TRIE","exclusionFiles":[],"inclusionFileType":"TRIE","inclusionFiles":[],"enrichments":["sentiment","country","language"],"streamGroups":[],"streams":[]},"type":"DATA_CURATION","order":0,"inputs":[{"name":"default","uri":{"type":"s3","path":"parquet5","bucket":"bsdatalake-streams"}}],"outputs":[{"name":"default","uri":{"type":"s3","path":"#{\\"final_datasets/job=\\" + pipelineId + \\"/step=\\" + stepId}","bucket":"bsinsights"}}],"id":"new_step_temp_0"}']

end