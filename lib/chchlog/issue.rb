module Chchlog
  module Issue
    def generate(pr_num, pull_url)
      "[##{pr_num}](#{pull_url})"
    end
  end
end
