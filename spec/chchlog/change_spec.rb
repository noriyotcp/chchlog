require 'spec_helper'

RSpec.describe Chchlog::Change do
  before(:suite) do
    root_dir = %x( git rev-parse --show-toplevel).strip
    target_dir = root_dir + "/spec/chchlog_test_repo/"
    Dir.chdir target_dir
  end

  after(:suite) do
    Dir.chdir root_dir
  end

  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }
  let(:chchlog_change) { Class.new { extend Chchlog::Change } }

  context "when it doesn't have an issue" do
    it 'returns a text representing the receiver as a body' do
      change = chchlog_change.generate_body('change')
      expect(change).to eq "  * change"
    end
  end

  context "when it has an issue" do
    it 'returns a text representing the receiver as a subject' do
      issue = chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/pull/1')
      change = chchlog_change.generate_subject('change', issue)
      expect(change).to eq "* change [#1](https://github.com/noriyotcp/chchlog/pull/1)"
    end
  end
end
