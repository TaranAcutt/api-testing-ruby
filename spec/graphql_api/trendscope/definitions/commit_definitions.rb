require './spec/graphql_api/trendscope/support/graphql_helpers'

module CommitDefinitions
  class << self
    attr_accessor :commit
  end
  
  @commit = [
    {
      query: 'commit',
      property_name: 'commit',
      schema: {
        commit: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]
end