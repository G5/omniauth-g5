require 'users/user_export'

namespace :g5 do
  desc "Create an auth user for each row in users table and dump id/password for update in auth server"
  task :export_users, [:client_id, :client_secret, :client_callback_url, :endpoint, :authorization_code] => :environment do |t, args|
    require 'users/user_export'
    args.with_defaults(:client_id => ENV['G5_AUTH_CLIENT_ID'],
                       :client_secret => ENV['G5_AUTH_CLIENT_SECRET'],
                       :client_callback_url => 'urn:ietf:wg:oauth:2.0:oob',
                       :endpoint => 'http://192.168.33.1:4000/oauth',
                       :authorization_code => '04224ef5f7c822eb3c7de51424a3d69a4923708c1684320f9d63227e81549371')
    G5::UserExport.new(args).export
  end
end
