require 'nty_change_log'

module Chchlog
  module Issue
    def generate(pr_num, pull_url)
      NTYChangeLog::Issue.new(pr_num, pull_url).to_s
    end
  end
end
