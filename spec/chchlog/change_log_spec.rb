require 'spec_helper'

RSpec.describe Chchlog::ChangeLog do
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }
  let(:chchlog_change) { Class.new { extend Chchlog::Change } }
  let(:chchlog_change_group) { Class.new { extend Chchlog::ChangeGroup } }
  let(:chchlog_versioning) { Class.new { extend Chchlog::Versioning } }
  let(:chchlog_change_log) { Class.new { extend Chchlog::ChangeLog } }

  context "when it has an issue" do
    let(:issue) { chchlog_issue.generate(1, 'https://github.com/noriyotcp/chchlog/pull/1') }

    let(:changes1) { [ chchlog_change.generate('changes1', issue) ] }
    let(:changes2) { [ chchlog_change.generate('changes2', nil) ] }

    let(:change_groups1) {
      [ chchlog_change_group.generate("Group1", changes1) ]
    }

    let(:change_groups2) {
      [ chchlog_change_group.generate("Group2", changes2) ]
    }

    let(:versions) do
      [
        chchlog_versioning.generate('Unreleased', change_groups1),
        chchlog_versioning.generate('1.0.0', change_groups2)
      ]
    end

    let(:change_log) { chchlog_change_log.generate(versions) }

    it 'returns a text representing the receiver' do
      text = <<~EOS.chomp
        # Change Log

        ## Unreleased

        ### Group1
        * changes1 [#1](https://github.com/noriyotcp/chchlog/pull/1)

        ## 1.0.0

        ### Group2
        * changes2
      EOS
      expect(change_log.to_s).to eq text
    end
  end
end
