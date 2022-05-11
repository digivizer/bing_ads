require 'rubygems'
require 'bundler/setup'
require 'bing_ads_api'
require 'dotenv'
require 'vcr'

Dotenv.load('.env.test.local', '.env.test')

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.default_cassette_options = { record: :new_episodes, allow_playback_repeats: true,
                                      match_requests_on: %i[method uri body] }
  config.hook_into :webmock

  %w[CUSTOMER_ID CUSTOMER_ACCOUNT_ID DEVELOPER_TOKEN OAUTH2_CLIENT_ID OAUTH2_CLIENT_SECRET ACCESS_TOKEN
     REFRESH_TOKEN].each do |value|
    config.filter_sensitive_data("<#{value}>") { ENV[value] }
  end
end

RSpec.configure do |config|
end
