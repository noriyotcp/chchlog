module Chchlog
  module Versioning
    def generate(name, change_groups)
      return <<~EOS
        ## #{name}

        #{change_groups.join("\n")}
      EOS
    end
  end
end
