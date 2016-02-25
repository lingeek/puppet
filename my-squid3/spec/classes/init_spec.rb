require 'spec_helper'
describe 'squid3' do

  context 'with defaults for all parameters' do
    it { should contain_class('squid3') }
  end
end
