require 'spec_helper'

describe 'g5:export_users' do
  include_context 'rake'

  let(:user_export) { double(:user_export, export: nil) }
  before { allow(G5::UserExport).to receive(:new).and_return(user_export) }

  before { ENV['G5_AUTH_CLIENT_ID'] = default_client_id }
  let(:default_client_id) { 'test_default_client_id' }

  def expect_user_export_init_with(option_name, expected_value)
    expect(G5::UserExport).to receive(:new) do |args|
      expect(args[option_name]).to eq(expected_value)
      user_export
    end
  end

  it 'should use the default client id from the environment' do
    expect_user_export_init_with(:client_id, default_client_id)
    task.invoke
  end

  it 'should allow the default client id to be overridden by an argument' do
    client_id_arg = 'custom_client_id_override'
    expect_user_export_init_with(:client_id, client_id_arg)
    task.invoke(client_id_arg)
  end

  it 'should export the users' do
    expect(user_export).to receive(:export)
    task.invoke
  end
end
