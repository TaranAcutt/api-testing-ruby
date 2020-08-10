require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/support/schema_fragments'

module VersionDefinitions
  class << self
    attr_accessor :version, :rand_version
  end
  
  @version = [
    {
      query: 'version',
      property_name: 'version',
      schema: {
          version: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
          }
      }
    }
  ]
  
  @rand_version = GraphqlHelpers.property_definition(@version)
end