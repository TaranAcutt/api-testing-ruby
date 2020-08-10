require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module UpdatePipelineQueries
  class << self
    attr_accessor :invalid_argument, :invalid_argument_type
  end

  ###VALID QUERIES###

  def self.update_pipeline_mutation_query(pipeline, steps)
    {
      query:
        'mutation updatePipeline($pipeline: PipelineUpdateInput!, $steps: [String]!) {
      updatePipeline(pipeline: $pipeline, steps: $steps) {
              ...pipeline
      }
    }

    fragment pipeline on Pipeline {
      id
      name
      status
      dataWindow {
        unit
        value
      }
      runInterval {
        unit
        value
      }
      markets {
        id
        name
        query
        timezone
      }
      startDate
      endDate
      steps {
        ...step
      }
      myPermission
      userPermissions {
        name
        permission
      }
      groupPermissions {
        name
        permission
      }
      organisationPermissions {
        name
        permission
      }
      createdBy
      createdDate
      lastModifiedBy
      lastModifiedDate
    }

    fragment step on Step {
      id
      type
      status
      order
      createdDate
      createdBy
      lastModifiedDate
      lastModifiedBy
      inputs {
        name
        ...inputUri
        ...inputStep
        config
      }
      outputs {
        name
        ...outputUri
      }
      repositories
      packages
      applicationClass
      application {
        ...fileUri
        ...s3FileUri
      }
      jars {
        ...fileUri
        ...s3FileUri
      }
      pyFiles {
        ...fileUri
        ...s3FileUri
      }
      bootstrapScripts {
        ...fileUri
        ...s3FileUri
      }
      config
    }

    fragment inputStep on InputStep {
      stepId
      outputName
    }

    fragment inputUri on InputUri {
      uri {
        ...fileUri
        ...s3FileUri
        ...databaseUri
        ...tableUri
      }
    }

    fragment outputUri on OutputUri {
      uri {
        ...fileUri
        ...s3FileUri
        ...databaseUri
        ...tableUri
      }
    }

    fragment fileUri on FileUri {
      type
      path
      format
    }

    fragment s3FileUri on S3FileUri {
      type
      path
      bucket
      format
    }

    fragment databaseUri on DatabaseUri {
      type
      host
      port
      database
      collection
    }

    fragment tableUri on TableUri {
      type
      database
      tableName
    }',
      variables: {pipeline: pipeline, steps: steps},
      operationName: 'updatePipeline'
    }.to_json
  end

  ###INVALID QUERIES###

  @invalid_argument =
    {
      query: 'mutation {
        updatePipeline(pipeline: "INVALID", steps: "INVALID") {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json

  @invalid_argument_type =
    {
      query: 'mutation {
        updatePipeline(pipeline: 2, steps: 2 ) {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json
end