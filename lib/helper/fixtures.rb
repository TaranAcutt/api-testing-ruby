require './lib/helper/request_helpers'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'

module Fixtures
  extend RequestHelpers
  class << self

    def create_accounts_fixtures
      if ENV['ACC_FIXTURES'] == 'true'
        get(Config.backend,
            'accounts/fixtures/create',
            authorization: GraphqlAuthTokens.trendscope_user)
        pp '---ACCOUNTS FIXTURES CREATED---'
      end
    end

    def delete_accounts_fixtures
      if ENV['ACC_FIXTURES'] == 'true'
        delete(Config.backend,
               'accounts/fixtures',
               authorization: GraphqlAuthTokens.trendscope_user)
        pp '---ACCOUNTS FIXTURES DELETED---'
      end
    end

    def create_permissions_fixtures
      if ENV['PERM_FIXTURES'] == 'true'
        post(Config.graphql,
            'graphql',
             {
               query:
                 'mutation {
                    setUpFixtures
                  }'}.to_json,
            Authorization: GraphqlAuthTokens.trendscope_user)
        pp '---PERMISSIONS FIXTURES CREATED---'
      end
    end

    def delete_permissions_fixtures
      if ENV['PERM_FIXTURES'] == 'true'
        post(Config.graphql,
             'graphql',
             {
               query:
                 'mutation {
                    tearDownFixtures
                  }'}.to_json,
             Authorization: GraphqlAuthTokens.trendscope_user)
        pp '---PERMISSIONS FIXTURES DELETED---'
      end
    end
  end
end