require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class G5 < OmniAuth::Strategies::OAuth2
      option :name, :g5

      option :client_options, {
        :site => 'https://auth.g5search.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        {:email => raw_info['email'],
         :name => display_name,
         :first_name => raw_info['first_name'],
         :last_name => raw_info['last_name']}
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed
      end

      def display_name
        "#{raw_info['first_name']} #{raw_info['last_name']}".strip
      end
    end
  end
end
