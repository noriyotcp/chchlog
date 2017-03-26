module Chchlog
  module ChangeLog
    def generate(versions)
      return <<~EOS.chomp
        # Change Log

        #{versions.join}
      EOS
    end
  end
end
