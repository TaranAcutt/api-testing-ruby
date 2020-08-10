module UpdateMutationVariables
  class << self
    attr_accessor :single_step_pipeline, :single_step
  end

  ###UPDATE DATA CURATION###

  @single_step_pipeline = {
    name: 'QATESTPIPELINE4',
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

  def self.update_pipeline (pipeline_id)
    {
      name: 'QATESTPIPELINE4UPDATE',
      status: 'NEW',
      markets: [
        {
          id: 'Global',
          name: 'Global',
          query: 'true',
          timezone: 'Europe/Paris'
        }
      ],
      startDate: '2018-11-02',
      endDate: '2018-11-29',
      id: pipeline_id
    }
  end

  def self.update_step (step_id)
    ['{"status":"ACTIVE","application":{"type":"s3","path":"#{settings(\\"insights.spark.curation.jar\\")}","bucket":"bsinsights"},"applicationClass":"com.blackswan.spark.CurationRunner","repositories":"https://nexus3.blackswan.com/repository/maven-public/","packages":["#{settings(\\"trie.package\\")}"],"config":{"exclusionFileType":"TRIE","exclusionFiles":[],"inclusionFileType":"TRIE","inclusionFiles":[],"enrichments":["urls","econtext_categories","country"],"streamGroups":[],"streams":[]},"id": "' + step_id + '","type":"DATA_CURATION","order":0,"createdDate":"2018-11-23T12:33:02+0000","createdBy":"bs_admin","lastModifiedDate":"2018-11-23T12:33:02+0000","lastModifiedBy":"bs_admin","inputs":[{"name":"default","uri":{"type":"s3","path":"parquet5","bucket":"bsdatalake-streams"}}],"outputs":[{"name":"default","uri":{"type":"s3","path":"#{\\"final_datasets/job=\\" + pipelineId + \\"/step=\\" + stepId}","bucket":"bsinsights"}}]}']
  end
end


