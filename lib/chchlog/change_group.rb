require 'nty_change_log'

module Chchlog
  module ChangeGroup
    def generate(name, changes)
      NTYChangeLog::ChangeGroup.new(name, changes)
    end
  end
end
