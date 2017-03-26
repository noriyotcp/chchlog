require 'spec_helper'

RSpec.describe Chchlog::Versioning do
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }
  let(:chchlog_change) { Class.new { extend Chchlog::Change } }
  let(:chchlog_change_group) { Class.new { extend Chchlog::ChangeGroup } }
  let(:chchlog_versioning) { Class.new { extend Chchlog::Versioning } }

  context "when it has an issue" do
    let(:issue) do
      chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/pull/1')
    end

    let(:changes1) do
      [
        chchlog_change.generate('with_issue', issue),
        chchlog_change.generate('without_issue', nil)
      ]
    end

    let(:changes2) do
      [
        chchlog_change.generate('with_issue', issue),
      ]
    end

    let(:change_groups) do
      [
        chchlog_change_group.generate("Group1", changes1),
        chchlog_change_group.generate("Group2", changes2)
      ]
    end

    let(:versioning) { chchlog_versioning.generate('1.0.0', change_groups) }

    it 'returns a text representing the receiver' do
      text = <<~EOS
        ## 1.0.0

        ### Group1
        * with_issue [#1](https://github.com/noriyotcp/chchlog/pull/1)
        * without_issue

        ### Group2
        * with_issue [#1](https://github.com/noriyotcp/chchlog/pull/1)

      EOS
      expect(versioning.to_s).to eq text
    end
  end
end
