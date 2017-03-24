require 'nty_change_log'

module Chchlog
  module Change
    def generate(commit_message, issue)
      NTYChangeLog::Change.new(commit_message, issue).to_s
    end
  end
end
