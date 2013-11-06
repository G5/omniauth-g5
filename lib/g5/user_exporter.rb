require 'g5_authentication_client'

module G5

  class UserExporter

    def initialize(options={})
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @client_callback_url = options[:client_callback_url]
      @endpoint = options[:endpoint]
      @authorization_code = options[:authorization_code]
    end

    def export
      users=[]
      User.all.each do |u|
        user=auth_client.create_user({email: u.email, password: 'yadayadayada'})
        u.uid=user.id
        u.provider='g5'
        u.save
        users<<[user.id,u.encrypted_password]
      end
      puts update_sql(users)
    end

    private

    def update_sql(users)
      users.collect{|user|"update users set encrypted_password='#{user.last}' where id=#{user.first};"}.join("\n")
    end

    def auth_client
      @oauth_client ||= G5AuthenticationClient::Client.new(client_id: @client_id,
                                        client_secret: @client_secret,
                                        client_callback_url: @client_callback_url,
                                        endpoint: @endpoint,
                                        authorization_code: @authorization_code)
    end

  end

end
