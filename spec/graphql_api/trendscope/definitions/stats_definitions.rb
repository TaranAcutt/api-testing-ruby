require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/schema_fragments'

module StatsDefinitions
  class << self
    attr_accessor :stats, :mongo_disk_space, :rand_mongo_disk_space, :pipeline_step_times, :rand_pipeline_step_times
  end
  
  @stats = [
    {
      query: 'mongoDiskUsage',
      property_name: 'mongoDiskUsage',
    },
    {
      query: 'mongoDiskUsageOverTime',
      property_name: 'mongoDiskUsageOverTime',
    },
    {
      query: 'pipelineStepTimes',
      property_name: 'pipelineStepTimes',
    }
  ]

  @mongo_disk_space = [
    {
      query: 'total',
      property_name: 'total',
      schema: {
        total: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'free',
      property_name: 'free',
      schema: {
        free: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'time',
      property_name: 'time',
      schema: {
        time: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    }
  ]

  @rand_mongo_disk_space = GraphqlHelpers.property_definition(@mongo_disk_space)

  @pipeline_step_times = [
    {
      query: 'type',
      property_name: 'type',
      schema: {
        type: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    },
    {
      query: 'minDuration',
      property_name: 'minDuration',
      schema: {
        minDuration: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'maxDuration',
      property_name: 'maxDuration',
      schema: {
        maxDuration: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'avgDuration',
      property_name: 'avgDuration',
      schema: {
        avgDuration: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    },
    {
      query: 'count',
      property_name: 'count',
      schema: {
        count: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
        }
      }
    }
  ]

  @rand_pipeline_step_times = GraphqlHelpers.property_definition(@pipeline_step_times)
end