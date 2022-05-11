require 'ads_common/api'
require 'ads_common/api_config'
require 'ads_common/credential_handler'
require 'ads_common/errors'
require 'ads_common/http'
require 'ads_common/savon_service'
require 'ads_common/parameters_validator'
require 'ads_common/build/savon_generator'
require 'ads_common/build/savon_service_generator'
require 'ads_common/build/savon_registry'
require 'ads_common/savon_headers/base_header_handler'
require 'ads_common/savon_headers/oauth_header_handler'
require 'ads_common/auth/client_login_handler'

####### AdsCommon Overriden for Bing Ads #########
module AdsCommonForBingAds
	class Api < AdsCommon::Api; end
	module ApiConfig; include AdsCommon::ApiConfig; end
	class Config < AdsCommon::Config; end
	class CredentialHandler < AdsCommon::CredentialHandler; end
	module Errors; include AdsCommon::Errors; end
	class Http < AdsCommon::Http; end
	class ParametersValidator < AdsCommon::ParametersValidator; end
	class ResultsExtractor < AdsCommon::ResultsExtractor; end
	class SavonService < AdsCommon::SavonService; end
	module Utils; include AdsCommon::Utils; end
	module ApiConfig; include AdsCommon::ApiConfig; end
	# Auth
	module Auth
		class BaseHandler < AdsCommon::Auth::BaseHandler; end
		class ClientLoginHandler < AdsCommon::Auth::ClientLoginHandler; end
		class OAuth2Handler < AdsCommon::Auth::OAuth2Handler; end
	end
	# Build
	module Build
		class SavonAbstractGenerator < AdsCommon::Build::SavonAbstractGenerator; end
		class SavonGenerator < AdsCommon::Build::SavonGenerator; end
		class SavonRegistry < AdsCommon::Build::SavonRegistry; end
		class SavonRegistryGenerator < AdsCommon::Build::SavonRegistryGenerator; end
		class SavonServiceGenerator < AdsCommon::Build::SavonServiceGenerator; end
	end
	# SavonHeaders
	module SavonHeaders
		class BaseHeaderHandler < AdsCommon::SavonHeaders::BaseHeaderHandler; end
		class OAuthHeaderHandler < AdsCommon::SavonHeaders::OAuthHeaderHandler; end
		# httpi_request_proxy is ::OAuth::RequestProxy::HTTPIRequest < OAuth::RequestProxy::Base
	end

end

AdsCommon::Build::SavonServiceGenerator::SERVICE_TEMPLATE = %q{<% %>
  # Encoding: utf-8
  #
  # This is auto-generated code, changes will be overwritten.
  #
  # Copyright:: Copyright <%= @year %>, Google Inc. All Rights Reserved.
  # License:: Licensed under the Apache License, Version 2.0.
  #
  # <%= @generator_stamp %>
  require 'ads_common/savon_service'
  require '<%= @require_path %>/<%= @service_name.to_s.snakecase %>_registry'

  <%= @modules_open_string %>
  class <%= @service_name %> < AdsCommonForBingAds::SavonService
    def initialize(config, endpoint)
		  namespace = '<%= @namespace %>'
		  super(config, endpoint, namespace, :<%= @version %>)
    end

    <% @actions.each do |action| %>
    def <%= action %>(*args, &block)
		  return execute_action('<%= action %>', args, &block)
    end

    <% end %>
    private

    def get_service_registry()
		  return <%= @service_name %>Registry
    end

    def get_module()
		  return <%= [@api_name, @version.to_s.upcase, @service_name].join('::') %>
    end
  end
  <%= @modules_close_string %>
  }.gsub(/^      /, '')