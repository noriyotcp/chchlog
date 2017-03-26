module Chchlog
  module ChangeGroup
    def generate(name, changes)
      return <<~EOS
        ### #{name}
        #{changes.join("\n")}
      EOS
    end
  end
end
