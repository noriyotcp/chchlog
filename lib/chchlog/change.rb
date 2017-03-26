require 'nty_change_log'

module Chchlog
  module Change
    def generate(commit_message, issue)
      return "* #{commit_message}" if issue.nil?
      "* #{commit_message} #{issue}"
    end
  end
end
