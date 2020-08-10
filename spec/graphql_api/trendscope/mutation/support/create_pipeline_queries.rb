require './spec/graphql_api/trendscope/definitions/pipeline_definitions'
require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

module CreatePipelineQueries
  class << self
    attr_accessor :invalid_argument, :invalid_argument_type, :missing_required_parent, :missing_required_field
  end

  ###VALID QUERIES###

  def self.create_pipeline_mutation_query(pipeline, steps)
    {
      query:
        'mutation createPipeline($pipeline: PipelineInput!, $steps: [String]!) {
      createPipeline(pipeline: $pipeline, steps: $steps) {
        id
        name
        status
      }
    }',
      variables: { pipeline: pipeline, steps: steps },
      operationName: 'createPipeline'
    }
  end


  def self.create_pipeline_mutation_full_query(pipeline, steps)
    { query: 'mutation createPipeline($pipeline: PipelineInput!, $steps: [String]!) {
      createPipeline(pipeline: $pipeline, steps: $steps) {
        ...pipeline
      }
    }

    fragment pipeline on Pipeline {
      id
      name
      status
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
    variables: { pipeline: pipeline, steps: steps },
    operationName: 'createPipeline' }.to_json
  end

  # def self.create_pipeline_mutation_full_query(pipeline, steps, query)
  #   {
  #     query:
  #       'mutation createPipeline($pipeline: PipelineInput!, $steps: [String]!) {
  #     createPipeline(pipeline: $pipeline, steps: $steps) {
  #       id
  #       name
  #       status
  #       dataWindow {
  #         value
  #         unit
  #       }
  #       runInterval {
  #         value
  #         unit
  #       }
  #       markets {
  #         id
  #         name
  #         query
  #       }
  #       startDate
  #       endDate
  #       steps {
  #         __typename ' + GraphqlHelpers.filtered_definitions(query.reduce([], :concat), :query).join(' ') + '
  #       }
  #       permissionLevel
  #     }
  #   }',
  #     variables: { pipeline: pipeline, steps: steps } ,
  #     operationName:'createPipeline'
  #   }
  # end

  ###INVALID QUERIES###

  @invalid_argument =
    {
      query: 'mutation {
        createPipeline(pipeline: "INVALID", steps: "INVALID" ) {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json

  @invalid_argument_type =
    {
      query: 'mutation {
        createPipeline(pipeline: 2, steps: 2 ) {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json

  @missing_required_parent =
    {
      query: 'mutation {
        createPipeline(pipeline: {"name":"QAFIXTURESPIPELINE20","status":"NEW","dataWindow":{"value":1,"unit":"DAY"},"runInterval":{"value":2,"unit":"MONTH"},"markets":[{"id":"Global","name":"Global","query":"true"}],"startDate":"2018-01-01","endDate":"2018-02-28"}, steps: ["{\"id\":\"new_step_0\",\"type\":\"TPV_REPORT\",\"status\":\"ACTIVE\",\"parentIds\":[],\"filter\":{\"type\":\"BSQL\",\"query\":\"QA FILTER\"},\"output\":{\"type\":\"local\",\"path\":\"file/path\"},\"idealTPV\":2,\"factors\":[\"sources\"],\"taxonomies\":[[{\"id\":\"Food Elements\",\"name\":\"Food Elements\"},{\"id\":\"Ingredients\",\"name\":\"Ingredients\"},{\"id\":\"Cream\",\"name\":\"Cream\"}]],\"order\":0}"] ) {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json

  @missing_required_field =
    {
      query: 'mutation {
        createPipeline(pipeline: {"status":"NEW","dataWindow":{"value":1,"unit":"DAY"},"runInterval":{"value":2,"unit":"MONTH"},"markets":[{"id":"Global","name":"Global","query":"true"}],"startDate":"2018-01-01","endDate":"2018-02-28"}, steps: ["{\"id\":\"new_step_0\",\"type\":\"TPV_REPORT\",\"status\":\"ACTIVE\",\"parentIds\":[],\"filter\":{\"type\":\"BSQL\",\"query\":\"QA FILTER\"},\"output\":{\"type\":\"local\",\"path\":\"file/path\"},\"idealTPV\":2,\"factors\":[\"sources\"],\"taxonomies\":[[{\"id\":\"Food Elements\",\"name\":\"Food Elements\"},{\"id\":\"Ingredients\",\"name\":\"Ingredients\"},{\"id\":\"Cream\",\"name\":\"Cream\"}]],\"order\":0}"] ) {
          ' + GraphqlHelpers.filtered_definitions(PipelineDefinitions.pipeline, :query).join(' ') + '
        }
      }'
    }.to_json
end