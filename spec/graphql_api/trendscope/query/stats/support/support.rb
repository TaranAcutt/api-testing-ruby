require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/stats_definitions'

module StatsSupport
  
  def self.mongo_disk_usage_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['stats'],
          properties: {
            stats: {
              type: 'object',
              required: ['mongoDiskUsage'],
              properties: {
                mongoDiskUsage: {
                  oneOf: [
                    {
                      type: 'object',
                      required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                      properties:
                        GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                    },
                    {
                      type: 'null'
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  end
  
  def self.mongo_disk_usage_schema_full
    mongo_disk_usage_schema(StatsDefinitions.mongo_disk_space)
  end
  
  def self.mongo_disk_usage_schema_rand
    mongo_disk_usage_schema(StatsDefinitions.rand_mongo_disk_space)
  end
  
  def self.pipeline_step_times_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['stats'],
          properties: {
            stats: {
              type: 'object',
              required: ['pipelineStepTimes'],
              properties: {
                pipelineStepTimes: {
                  oneOf: [
                    {
                      type: 'array',
                      items: {
                        type: 'object',
                        required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                        properties:
                          GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                      }
                    },
                    {
                      type: 'null'
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  end
  
  def self.pipeline_step_times_schema_full
    pipeline_step_times_schema(StatsDefinitions.pipeline_step_times)
  end
  
  def self.pipeline_step_times_schema_rand
    pipeline_step_times_schema(StatsDefinitions.rand_pipeline_step_times)
  end

  def self.mongo_disk_usage_over_time_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['stats'],
          properties: {
            stats: {
              type: 'object',
              required: ['mongoDiskUsageOverTime'],
              properties: {
                mongoDiskUsageOverTime: {
                  oneOf: [
                    {
                      type: 'array',
                      items: {
                        type: 'object',
                        required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                        properties:
                          GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                      }
                    },
                    {
                      type: 'null'
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  end

  def self.mongo_disk_usage_over_time_schema_full
    mongo_disk_usage_over_time_schema(StatsDefinitions.mongo_disk_space)
  end

  def self.mongo_disk_usage_over_time_schema_rand
    mongo_disk_usage_over_time_schema(StatsDefinitions.rand_mongo_disk_space)
  end
end
