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
         :last_name => raw_info['last_name'],
         :phone => raw_info['phone_number']}
      end

      extra do
        {:raw_info => raw_info,
         :title => raw_info['title'],
         :organization_name => raw_info['organization_name'],
         :roles => roles}
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed
      end

      def display_name
        "#{raw_info['first_name']} #{raw_info['last_name']}".strip
      end

      def roles
        [raw_info['roles']].flatten.collect do |role|
          {name: role['name'], type: role['type'], urn: role['urn']}
        end
      end
    end
  end
end
