require 'spec_helper_acceptance'

describe 'ruby class' do
  let(:pp) { "class { 'ruby': version => '2.1.1' }" }

  context 'idempotent installation' do
    it 'exits with a zero exit code' do
      expect(apply_manifest(pp).exit_code).to eq(0)
      expect(apply_manifest(pp).exit_code).to_not eq(1)
    end
  end

  context 'versions' do
    before { apply_manifest(pp) }

    it 'with a login shell the version of ruby will be as requested' do
      ruby_version = shell('ruby --version').stdout

      expect(ruby_version).to match(/^ruby 2.1.1p76/)
    end

    it 'without a login shell the version of ruby will be system' do
      ruby_version = shell('ruby --version').stdout

      expect(ruby_version).to match(/^ruby 1.8.7/)
    end
  end
end
