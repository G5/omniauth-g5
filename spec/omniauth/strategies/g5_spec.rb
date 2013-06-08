require 'spec_helper'

describe OmniAuth::Strategies::G5 do
  subject { strategy }
  let(:strategy) { OmniAuth::Strategies::G5.new({}) }

  its(:name) { should == :g5 }

  describe 'client_options' do
    subject(:client_options) { strategy.options.client_options }

    its(:site) { should == 'https://auth.g5search.com' }
    its(:authorize_url) { should == '/oauth/authorize' }
  end

  describe '#uid' do
  end

  describe '#info' do
  end

  describe '#raw_info' do

  end
end
