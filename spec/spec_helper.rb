require 'rspec'
require 'rest-client'
require 'json_spec'
require 'json-schema'
require 'jsonpath'
require 'colorize'
require 'rspec_junit_formatter'
require './lib/helper/config'
require './lib/helper/helpers'
require './lib/helper/fixtures'
require './lib/helper/request_helpers'
require './lib/helper/schema_helpers'
require './spec/graphql_api/trendscope/support/requests'
require './spec/custom_matchers'
require './spec/support/shared_examples'
require 'oj'
require 'faraday'

Fixtures.create_accounts_fixtures
# Fixtures.create_permissions_fixtures

RSpec.configure do |config|
  config.include Helpers
  config.include RequestHelpers
  config.include SchemaHelpers
  # config.before(:suite, perm: true) { Fixtures.create_permissions_fixtures }
  # config.after(:suite, perm: true) { Fixtures.delete_permissions_fixtures }
  config.after(:suite) { Fixtures.delete_accounts_fixtures }
  # config.after(:example) do |example|
  #   response_upon_error(response[:json]) if example.exception
  # end
end

RestClient.log = STDOUT

ctx = OpenSSL::SSL::SSLContext.new
ctx.ssl_version = :TLSv1_2

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
