require 'spec_helper'

describe OmniAuth::Strategies::G5 do
  subject { strategy }
  let(:strategy) { OmniAuth::Strategies::G5.new(rack_app, app_id, app_secret, options) }

  let(:rack_app) { double(:rack_app) }
  let(:app_id) { 'test_app' }
  let(:app_secret) { '1234567890qwerty' }
  let(:options) { Hash.new }

  let(:access_token) { double(:access_token, :get => response) }
  let(:response) { double(:response, :parsed => parsed_response) }
  let(:parsed_response) { double(:parsed_response) }
  before { strategy.stub(:access_token => access_token) }

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
      its(:token_url) { should == '/oauth/token' }
    end

    context 'with partially overridden options' do
      let(:options) do
        {:client_options => {:site => 'https://custom.app.com'}}
      end

      its(:site) { should == 'https://custom.app.com' }
      its(:authorize_url) { should == '/oauth/authorize' }
      its(:token_url) { should == '/oauth/token' }
    end
  end

  describe '#raw_info' do
    subject(:raw_info) { strategy.raw_info }

    it 'should retrieve the user info from the server' do
      access_token.should_receive(:get).with('/v1/me.json').and_return(response)
      raw_info
    end

    it { should == parsed_response }
  end

  describe '#uid' do
    subject(:uid) { strategy.uid }
    let(:parsed_response) do
      {'id' => 123}
    end

    it { should == 123 }
  end

  describe '#info' do
    subject(:info) { strategy.info }
    let(:parsed_response) do
      {'email' => 'test@test.com'}
    end

    its([:email]) { should == 'test@test.com' }
  end
end
