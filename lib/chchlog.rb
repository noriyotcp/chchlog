require "chchlog/issue"
require "chchlog/change"
require "chchlog/change_group"
require "chchlog/versioning"
require "chchlog/version"

module Chchlog
  # TODO: It's just a dummy method!
  def self.hello
    'Hello!'
  end

  # These following line may be used in other file
  # e.g. git@github.com:noriyotcp/chchlog_test_repo.git
  # owner_and_repo = %x( git remote get-url --push origin )
  # e.g. notiyotcp/chchlog_test_repo/pulls/
  # owner_and_repo.strip
  #                      .slice!(/https:\/\/github.com\/|git@github.com:/)
  #                      .gsub(/(.git)/, "/pulls/")
  # pull_num = %x( \git log --merges --oneline --reverse --ancestry-path #{hash}...HEAD | grep 'Merge pull request #' | grep -oE '#[[:digit:]]+' | head -n1 | cut -b 2- )

end
