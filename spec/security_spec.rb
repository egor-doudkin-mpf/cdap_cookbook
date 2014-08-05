require 'spec_helper'

describe 'cdap::security' do
  context 'on Centos 6.4 x86_64' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: 6.4) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command('update-alternatives --display cdap-conf | grep best | awk \'{print $5}\' | grep /etc/cdap/conf.chef').and_return(false)
      end.converge(described_recipe)
    end

    it 'installs cdap-security package' do
      expect(chef_run).to install_package('cdap-security')
    end

  end
end