require 'nty_change_log'

module Chchlog
  module ChangeLog
    def generate(versions)
      NTYChangeLog::ChangeLog.new(versions)
    end
  end
end
