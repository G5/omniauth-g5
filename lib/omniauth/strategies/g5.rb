module OmniAuth
  module Strategies
    class G5 < OmniAuth::Strategies::OAuth2
      option :name, :g5

      option :client_options, {
        :site => 'https://auth.g5search.com',
        :authorize_url => '/oauth/authorize'
      }

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed
      end
    end
  end
end
