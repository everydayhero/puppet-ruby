require 'spec_helper'

describe('ruby') do
  let(:facts) { {osfamily: 'Debian'} }
  let(:params) { {version: '2.1.1'} }

  it { should compile.with_all_deps }

  it { should contain_class('rbenv') }
  it { should contain_rbenv__plugin('sstephenson/ruby-build') }
  it { should contain_rbenv__build('2.1.1').with(global: true) }
end
