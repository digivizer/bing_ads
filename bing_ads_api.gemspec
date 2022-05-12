# -*- encoding: utf-8 -*-
#
# Authors:: Adrien Rambert
#
# Copyright:: Copyright 2012, Adrien Rambert
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bing_ads_api/version'

Gem::Specification.new do |s|
  s.name = 'bing_ads_api'
  s.version = BingAdsApi::ApiConfig::CLIENT_LIB_VERSION
  s.summary = 'Ruby wrapper for Bing Ads API v9'
  s.description = 'Ruby wrapper for Bing Ads API v9'
  s.homepage = 'https://github.com/digivizer/bing_ads_api'
  s.authors = ['Tom Hammond']
  s.email = ['thomas.hammond89@gmail.com']
  s.require_path = 'lib'
  s.files = Dir.glob('{lib,test}/**/*') + %w(rakefile.rb README.md)
  s.license = 'MIT'

  s.add_dependency('activesupport', '>= 3.1.0')
  s.add_dependency('addressable')
  s.add_dependency('google-ads-common')
  s.add_dependency('savon')
  s.add_development_dependency('rack', '>= 1.6.12')
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.8'
  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
