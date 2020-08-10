require './lib/helper/config'
require './lib/helper/request_helpers'

module GraphqlAuthTokens
  module_function
  
  def get_token(client_id, username, password)
    graphql, = RequestHelpers.post( Config.auth,
                                    Config.sso_login_path,
                                    { client_id: client_id,
                                      grant_type: 'password',
                                      username: username,
                                      password: password },
                                    nil)
    graphql['access_token']
  end
  
  def trendscope_user
    @trendscope_user ||=
      'Bearer ' + get_token('trendscope', Config.graphql_credentials['username'], Config.graphql_credentials['password'])
  end
  
  def qafixtures_user1
    @qafixtures_user1 ||=
      'Bearer ' + get_token('trendscope', Config.qafixtures_user1['username'], Config.qafixtures_user1['password'])
  end
  
  def qafixtures_user2
    @qafixtures_user2 ||=
      'Bearer ' + get_token('trendscope', Config.qafixtures_user2['username'], Config.qafixtures_user2['password'])
  end
end