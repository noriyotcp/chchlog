require "spec_helper"

RSpec.describe Chchlog::Issue do
  # pr_num = %x( \git log --merges --oneline --reverse --ancestry-path #{hash}...HEAD | grep 'Merge pull request #' | grep -oE '#[[:digit:]]+' | head -n1 | cut -b 2- )
  # pull_url = %x( git remote get-url --push origin ).strip.gsub(/(.git)/, "/pulls/")

  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec
  # http://stackoverflow.com/questions/1542945/testing-modules-in-rspec#comment68421749_10802518
  # http://qiita.com/tq_jappy/items/ed56b0f4a20500252461
  let(:chchlog_issue) { Class.new { extend Chchlog::Issue } }

  # TODO: These are just dummies!
  pr_num = 1
  pull_url = "https://github.com/UteroOS/utero/pulls/#{pr_num}"

  it "returns a text representing the receiver" do
    issue = chchlog_issue.generate(pr_num, pull_url)
    expect(issue).to eq "[#1](https://github.com/UteroOS/utero/pulls/1)"
  end
end
