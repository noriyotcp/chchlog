require 'spec_helper'

RSpec.describe Chchlog::Change do
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }
  let(:chchlog_change) { Class.new { extend Chchlog::Change } }

  context "when it doesn't have an issue" do
    it 'returns a text representing the receiver as a body' do
      change = chchlog_change.generate('change', nil)
      expect('  ' + change.to_s).to eq "  * change"
    end
  end

  context "when it has an issue" do
    it 'returns a text representing the receiver as a subject' do
      issue = chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/pull/1')
      change = chchlog_change.generate('change', issue)
      expect(change.to_s).to eq "* change [#1](https://github.com/noriyotcp/chchlog/pull/1)"
    end
  end
end
