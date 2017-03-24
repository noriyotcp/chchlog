require 'nty_change_log'

module Chchlog
  module Versioning
    def generate(name, change_groups)
      NTYChangeLog::Version.new(name, change_groups)
    end
  end
end
