require 'rubygems'
require 'bundler/setup'

require 'bing_ads_api' # and any other gems you need

require 'dotenv'
Dotenv.load('.env.test.local')

RSpec.configure do |config|
  # some (optional) config here
end