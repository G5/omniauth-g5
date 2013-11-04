require 'spec_helper'

describe 'g5:export_users' do
  include_context 'rake'

  let(:user_export) { double(:user_export, export: nil) }
  before { allow(G5::UserExport).to receive(:new).and_return(user_export) }

  it 'should export the users' do
    expect(user_export).to receive(:export)
    task.invoke
  end
end
