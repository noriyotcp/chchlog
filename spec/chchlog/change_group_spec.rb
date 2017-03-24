require 'spec_helper'

RSpec.describe Chchlog::ChangeGroup do
  before(:suite) do
    root_dir = %x( git rev-parse --show-toplevel).strip
    target_dir = root_dir + "/spec/chchlog_test_repo/"
    Dir.chdir target_dir
  end

  after(:suite) do
    Dir.chdir root_dir
  end

  let(:chchlog_change) { Class.new { extend Chchlog::Change } }
  let(:chchlog_change_group) { Class.new { extend Chchlog::ChangeGroup } }

  xcontext "when it doesn't have an issue" do
    it 'returns a text representing the receiver' do
      change = chchlog_change.generate('change', nil)
      expect(change).to eq "* change"
    end
  end

  context "when it has an issue" do
    let(:changes) do
      [
        chchlog_change.generate_subject('subject', '[#1](https://github.com/noriyotcp/chchlog/pull/1)'),
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
