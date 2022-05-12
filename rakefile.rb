# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
require 'rdoc/task'
require "rspec/core/rake_task"
require 'dotenv'
require 'net/http'

desc "Run all test with spec"
RSpec::Core::RakeTask.new('spec') do |spec|
  spec.rspec_opts = %w[--color]
  spec.pattern = 'spec/*_spec.rb'
end

desc "Run tests"
task :default => :spec

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BingAdsApi'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# GENERATE API SERVICES
require 'ads_common_for_bing_ads'
require 'bing_ads_api/api_config'
require 'ads_common_for_bing_ads/api_config'
require 'ads_common_for_bing_ads/build/savon_registry'
desc 'Generate the Bing Ads API stubs.'

task :generate do
  logger = Logger.new(STDOUT)
  logger.level = Logger::INFO
  api_config = BingAdsApi::ApiConfig
  versions = [:v13]
  versions.each do |version|
    code_path = 'lib/%s/%s' % [api_config.api_name.to_s.snakecase, version]
    wsdls = BingAdsApi::ApiConfig.get_wsdls(version)
    wsdls.each do |service_name, wsdl_url|
      logger.info('Processing %s at [%s]...' % [service_name, wsdl_url])
      generator = AdsCommonForBingAds::Build::SavonGenerator.new(wsdl_url, code_path, api_config.api_name, version, service_name)
      generator.process_wsdl()
    end
  end
end

task :refresh_dotenv do
  FILENAME = ".env.test.local"

  env = Dotenv::Parser.new(File.read(FILENAME)).call

  uri = URI("https://login.microsoftonline.com/common/oauth2/v2.0/token")
  params = {
    :grant_type => 'refresh_token',
    :refresh_token => env["REFRESH_TOKEN"],
    :client_id => env["OAUTH2_CLIENT_ID"],
    :client_secret => env["OAUTH2_CLIENT_SECRET"]
  }

  json = Net::HTTP.post_form(uri, params).body

  refreshed_credential_values = JSON.parse(json)

  env['ACCESS_TOKEN'] = refreshed_credential_values['access_token']

  env_file = env.map { |row| row.join('=') }.join("\n")

  File.write(FILENAME, env_file)

  puts "Written new token to #{FILENAME}"
end