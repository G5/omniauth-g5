require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class G5 < OmniAuth::Strategies::OAuth2
      option :name, :g5

      option :client_options, {
        :site => 'https://auth.g5search.com',
        :authorize_url => '/oauth/authorize'
      }
    end
  end
end
