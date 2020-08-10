require './spec/graphql_api/trendscope/support/graphql_helpers'
require './lib/helper/request_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'

class Requests
  extend RequestHelpers
  
  class << self
    
    def get(path)
      @_get ||=
        begin
          @parsed, @raw = RequestHelpers.get(Config.graphql, path, Authorization: GraphqlAuthTokens.trendscope_user)
        end
    end
    
    def graphql(query)
      @_graphql ||= Hash.new do |h, key|
        h[key] = (@json, @raw = RequestHelpers.post(Config.graphql,
          'graphql',
          key,
          Authorization: GraphqlAuthTokens.trendscope_user))
      end
      @response = {
        json: @_graphql[query][0],
        raw: @_graphql[query][1]
      }
    end
    
    def graphql3
      @_graphql3 ||=
        begin
          @json, @raw = RequestHelpers.post(Config.graphql,
            'graphql',
            key,
            Authorization: GraphqlAuthTokens.trendscope_user)
        end
    end
    
    def graphql_user1(query)
      @_graphql_user1 ||= Hash.new do |h, key|
        h[key] = (@js1, @r1 = RequestHelpers.post(Config.graphql,
          'graphql',
          key,
          Authorization: GraphqlAuthTokens.qafixtures_user1))
      end
      
      {
        json: @_graphql_user1[query][0],
        raw: @_graphql_user1[query][1]
      }
    end
    
    def graphql_user2(query)
      @_graphql_user2 ||= Hash.new do |h, key|
        h[key] = (@js2, @r2 = RequestHelpers.post(Config.graphql,
          'graphql',
          key,
          Authorization: GraphqlAuthTokens.qafixtures_user2))
      end
      
      {
        json: @_graphql_user2[query][0],
        raw: @_graphql_user2[query][1]
      }
    end
    
    def graphql2(query)
      @_graphql2 ||= Hash.new do |h, key|
        h[key] = (@json, @raw = RequestHelpers.post(Config.graphql,
          'graphql',
          key,
          Authorization: GraphqlAuthTokens.trendscope_user))
      end
      {
        json: @_graphql2[query][0],
        raw: @_graphql2[query][1]
      }
    end
  end
end