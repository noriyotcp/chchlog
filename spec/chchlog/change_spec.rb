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

  # NOTE: the following line may be used in other files
  # pull_num = %x( \git log --merges --oneline --reverse --ancestry-path #{hash}...HEAD | grep 'Merge pull request #' | grep -oE '#[[:digit:]]+' | head -n1 | cut -b 2- )

  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }
  let(:chchlog_change) { Class.new { extend Chchlog::Change } }

  # e.g. git@github.com:noriyotcp/chchlog_test_repo.git
  owner_and_repo = %x( git remote get-url --push origin )
  # e.g. notiyotcp/chchlog_test_repo/pulls/
  owner_and_repo.strip
                       .slice!(/https:\/\/github.com\/|git@github.com:/)
                       .gsub(/(.git)/, "/pulls/")

  # commit_message is just dummy
  commit_message = "change"

  context "when it doesn't have an issue" do
    it 'returns a text representing the receiver' do
      change = chchlog_change.generate(commit_message, nil)
      expect(change).to eq "* change"
    end
  end

  context "when it has an issue" do
    pull_num = 1
    pull_url = "https://github.com/#{owner_and_repo}#{pull_num}"

    it 'returns a text representing the receiver' do
      issue = chchlog_issue.generate(pull_num, pull_url)
      change = chchlog_change.generate(commit_message, issue)
      expect(change).to eq "* change [##{pull_num}](#{pull_url})"
    end
  end
end
