####### Overriden for Bing Ads #########
module AdsCommonForBingAds
  module Auth

    class OAuth2Handler

      OAUTH2_CONFIG_BING = {
          :authorization_uri =>
              'https://login.live.com/oauth20_authorize.srf',
          :token_credential_uri =>
              'https://login.live.com/oauth20_token.srf'
      }

      def auth_string(credentials)
        @scopes = ['msads.manage']
        token = get_token(credentials)
        token[:access_token]
      end

      private

      def create_client(credentials)
        oauth_options_bing = OAUTH2_CONFIG_BING.merge({
                                                          :client_id => credentials[:oauth2_client_id],
                                                          :client_secret => credentials[:oauth2_client_secret],
                                                          :scope => @scope,
                                                          :redirect_uri => credentials[:oauth2_callback] || DEFAULT_CALLBACK,
                                                          :state => credentials[:oauth2_state],
                                                          :refresh_token => credentials[:oauth2_token][:refresh_token],
                                                          :access_token => credentials[:oauth2_token][:access_token]
                                                      }).reject {|k, v| v.nil?}
        client = Signet::OAuth2::Client.new(oauth_options_bing)  
        # Refresh client tokens unless access_token was provided
        client.refresh! unless credentials[:oauth2_token][:access_token].present?
        return client
      end
    end
  end
end
