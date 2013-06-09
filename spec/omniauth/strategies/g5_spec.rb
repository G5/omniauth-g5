require 'spec_helper'

describe OmniAuth::Strategies::G5 do
  before { OmniAuth.config.test_mode = true }
  after { OmniAuth.config.test_mode = false }

  subject { strategy }
  let(:strategy) { OmniAuth::Strategies::G5.new(rack_app, app_id, app_secret, options) }

  let(:rack_app) { mock(:rack_app) }
  let(:app_id) { 'test_app' }
  let(:app_secret) { '1234567890qwerty' }
  let(:options) { Hash.new }

  its(:name) { should == :g5 }

  it 'should have the correct client id' do
    expect(strategy.options[:client_id]).to eq(app_id)
  end

  it 'should have the correct client secret' do
    expect(strategy.options[:client_secret]).to eq(app_secret)
  end

  describe 'client_options' do
    subject(:client_options) { strategy.options.client_options }

    context 'with default options' do
      its(:site) { should == 'https://auth.g5search.com' }
      its(:authorize_url) { should == '/oauth/authorize' }
    end

    context 'with partially overridden options' do
      let(:options) do
        {:client_options => {:site => 'https://custom.app.com'}}
      end

      its(:site) { should == 'https://custom.app.com' }
      its(:authorize_url) { should == '/oauth/authorize' }
    end
  end

  describe '#raw_info' do

  end
end
