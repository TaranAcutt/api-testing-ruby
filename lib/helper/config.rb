require './lib/helper/request_helpers'

module Config
  extend RequestHelpers
  class << self
    attr_accessor :credentials, :backend, :auth, :accounts, :brain, :data, :datasource_admin, :metric_store, :graphql, :graphql_auth, :positioning_machine, :google, :graph, :_metric, :_unique_id, :_from, :_to, :_client, :user, :trendscope, :graphql_credentials, :qafixtures_user1, :qafixtures_user2,
                  :sso_login_path
  end

  file = File.read("lib/CONFIG_FILE/#{ENV['CONFIG_FILE']}.json")

  @config = JSON.parse(file)

  # from config
  @backend = @config['hosts']['backend']
  @auth = @config['hosts']['auth']
  @brain = @config['hosts']['brain']
  @accounts = @config['hosts']['accounts']
  @data = @config['hosts']['data']
  @datasource_admin = @config['hosts']['datasource_admin']
  @positioning_machine = @config['hosts']['positioning_machine']
  @metric_store = @config['hosts']['metric_store']
  @trendscope = @config['hosts']['trendscope']
  @graph = @config['hosts']['graph']
  @google = @config['hosts']['google']
  @credentials = @config['credentials']
  @user = @config['user']
  @graphql = @config['hosts']['trendscope']
  @graphql_auth = @config['hosts']['graphql_auth'] || @config['hosts']['graphql']
  @graphql_credentials = @config['credentials']['trendscopeUser']
  @qafixtures_user1 = @config['credentials']['fixturesUser1']
  @qafixtures_user2 = @config['credentials']['fixturesUser2']
  @sso_login_path = @config['loginPaths']['trendscope']

  # from env/api
  @_client = ENV['CLIENT']
  @_metric = ENV['METRIC']
  @_unique_id = ENV['UNIQUE_ID']
  @_from = ENV['FROM']
  @_to = ENV['TO']

end


