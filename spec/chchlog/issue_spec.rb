require 'spec_helper'

RSpec.describe Chchlog::Issue do
  before(:suite) do
    root_dir = %x( git rev-parse --show-toplevel).strip
    target_dir = root_dir + "/spec/chchlog_test_repo/"
    Dir.chdir target_dir
  end

  after(:suite) do
    Dir.chdir root_dir
  end

  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec
  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec#comment68421749_10802518
  # http://qiita.com/tq_jappy/items/ed56b0f4a20500252461
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }

  it 'returns a text representing the receiver' do
    issue = chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/1')
    expect(issue).to eq "[#1](https://github.com/noriyotcp/chchlog/1)"
  end
end
