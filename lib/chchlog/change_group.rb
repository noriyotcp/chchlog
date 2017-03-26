require 'nty_change_log'

module Chchlog
  module ChangeGroup
    def generate(name, changes)
      return <<~EOS.chomp
        ### #{name}
        #{changes.join("\n")}
      EOS
    end
  end
end
