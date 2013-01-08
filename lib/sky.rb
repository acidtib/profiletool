module Sky

  class IsAppSite
    def self.matches?(request)
      if (request.host == "profiletool.dev")
        true
      else
        if request.subdomain == "dashboard"
          true
        else
          false
        end
      end
    end
  end

end
