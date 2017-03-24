require 'spec_helper'

RSpec.describe Chchlog::Issue do
  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec
  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec#comment68421749_10802518
  # http://qiita.com/tq_jappy/items/ed56b0f4a20500252461
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }

  it 'returns a text representing the receiver' do
    issue = chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/pull/1')
    expect(issue).to eq "[#1](https://github.com/noriyotcp/chchlog/pull/1)"
  end
end
