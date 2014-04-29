require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

hosts.each { |host| install_puppet }

RSpec.configure do |config|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  config.before(:suite) do
    puppet_module_install(source: proj_root, module_name: 'ruby')
    hosts.each do |host|
      on host, puppet('module', 'install', 'jdowning-rbenv'), acceptable_exit_codes: [0, 1]
    end
  end
end
