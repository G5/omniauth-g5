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
  before { allow(strategy).to receive(:access_token).and_return(access_token) }

  its(:name) { is_expected.to eq(:g5) }

  it 'should have the correct client id' do
    expect(strategy.options[:client_id]).to eq(app_id)
  end

  it 'should have the correct client secret' do
    expect(strategy.options[:client_secret]).to eq(app_secret)
  end

  describe 'client_options' do
    subject(:client_options) { strategy.options.client_options }

    context 'with default options' do
      its(:site) { is_expected.to eq('https://auth.g5search.com') }
      its(:authorize_url) { is_expected.to eq('/oauth/authorize') }
      its(:token_url) { is_expected.to eq('/oauth/token') }
    end

    context 'with partially overridden options' do
      let(:options) do
        {:client_options => {:site => 'https://custom.app.com'}}
      end

      its(:site) { is_expected.to eq('https://custom.app.com') }
      its(:authorize_url) { is_expected.to eq('/oauth/authorize') }
      its(:token_url) { is_expected.to eq('/oauth/token') }
    end
  end

  describe '#raw_info' do
    subject(:raw_info) { strategy.raw_info }

    it 'should retrieve the user info from the server' do
      expect(access_token).to receive(:get).with('/v1/me.json').and_return(response)
      raw_info
    end

    it { is_expected.to eq(parsed_response) }
  end

  describe '#uid' do
    subject(:uid) { strategy.uid }
    let(:parsed_response) do
      {'id' => 123}
    end

    it { is_expected.to eq(123) }
  end

  describe '#info' do
    subject(:info) { strategy.info }
    let(:parsed_response) do
      {'email' => email,
       'first_name' => first_name,
       'last_name' => last_name,
       'phone_number' => phone_number}
    end

    let(:email) { 'test@test.com' }
    let(:first_name) { 'Test' }
    let(:last_name) { 'User' }
    let(:phone_number) { '(555) 555-5555' }

    its([:email]) { is_expected.to eq(email) }
    its([:name]) { is_expected.to eq("#{first_name} #{last_name}") }
    its([:first_name]) { is_expected.to eq(first_name)}
    its([:last_name]) { is_expected.to eq(last_name) }
    its([:phone]) { is_expected.to eq(phone_number) }
  end

  describe '#extra' do
    subject(:extra) { strategy.extra }
    let(:parsed_response) do
      {'title' => title,
       'organization_name' => org_name,
       'roles' => roles}
    end

    let(:title) { 'Grand Poobah' }
    let(:org_name) { 'Test Org' }
    let(:roles) { [{'name' => 'viewer'}] }

    its([:raw_info]) { is_expected.to eq(parsed_response) }
    its([:title]) { is_expected.to eq(title) }
    its([:organization_name]) { is_expected.to eq(org_name) }
    its([:roles]) { is_expected.to eq(strategy.roles) }
  end

  describe '#display_name' do
    subject(:display_name) { strategy.display_name }
    let(:parsed_response) do
      {'first_name' => first_name,
       'last_name' => last_name}
    end

    let(:first_name) {}
    let(:last_name) {}

    context 'with first and last name' do
      let(:first_name) { 'Test' }
      let(:last_name) { 'User' }

      it { is_expected.to eq("#{first_name} #{last_name}")}
    end

    context 'with first name only' do
      let(:first_name) { 'Test'}

      it { is_expected.to eq(first_name) }
    end

    context 'with last name only' do
      let(:last_name) { 'User' }

      it { is_expected.to eq(last_name) }
    end

    context 'without name fields' do
      it { is_expected.to eq('') }
    end
  end

  describe '#roles' do
    subject(:roles) { strategy.roles }
    let(:parsed_response) do
      {'roles' => role_data}
    end

    context 'when roles are empty' do
      let(:role_data) { [] }

      it { is_expected.to be_empty }
    end

    context 'when there is one role' do
      let(:role_data) { [{'name' => 'viewer'}] }

      its(:count) { is_expected.to eq(1) }

      it 'should return the role name' do
        expect(roles.first[:name]).to eq(role_data.first['name'])
      end
    end

    context 'when there are two roles' do
      let(:role_data) do
        [{'name' => 'super_admin'},
         {'name' => 'editor'}]
      end

      its(:count) { is_expected.to eq(2) }
      it { is_expected.to include({name: 'super_admin'}) }
      it { is_expected.to include({name: 'editor'}) }
    end
  end
end
