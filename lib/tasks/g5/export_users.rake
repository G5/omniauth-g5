require 'g5/user_exporter'

namespace :g5 do
  desc "Create an auth user for each row in users table and dump id/password for update in auth server"
  task :export_users, [:authorization_code, :client_id, :client_secret, :client_callback_url, :endpoint] => :environment do |t, args|
    args.with_defaults(:client_id => ENV['G5_AUTH_CLIENT_ID'],
                       :client_secret => ENV['G5_AUTH_CLIENT_SECRET'],
                       :client_callback_url => ENV['G5_AUTH_CLIENT_CALLBACK_URL'],
                       :endpoint => ENV['G5_AUTH_ENDPOINT'],
                       :authorization_code => ENV['G5_AUTH_AUTHORIZATION_CODE'])
    G5::UserExporter.new(args).export
  end
end
