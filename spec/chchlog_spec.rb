require 'spec_helper'

RSpec.describe Chchlog do
  # NOTE: This hooks may be used in other test
  # before(:suite) do
  #   root_dir = %x( git rev-parse --show-toplevel).strip
  #   target_dir = root_dir + "/spec/chchlog_test_repo/"
  #   Dir.chdir target_dir
  # end
  #
  # after(:suite) do
  #   Dir.chdir root_dir
  # end

  it 'has a version number' do
    expect(Chchlog::VERSION).not_to be nil
  end

  xit 'does something useful' do
    expect(false).to eq(true)
  end
end
