require 'spec_helper'

RSpec.describe Chchlog::ChangeGroup do
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }
  let(:chchlog_change) { Class.new { extend Chchlog::Change } }
  let(:chchlog_change_group) { Class.new { extend Chchlog::ChangeGroup } }

  context "when it has an issue" do
    let(:issue) { chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/pull/1') }

    let(:changes) do
      [
        chchlog_change.generate_subject('subject', issue),
        chchlog_change.generate_body('body')
      ]
    end

    let(:change_group) {
      chchlog_change_group.generate("Group1", changes)
    }

    it 'returns a text representing the receiver' do
      text = <<~EOS.chomp
        ### Group1
        * subject [#1](https://github.com/noriyotcp/chchlog/pull/1)
          * body
      EOS
      expect(change_group).to eq text
    end
  end
end
