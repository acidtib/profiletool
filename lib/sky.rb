module Sky

  class IsAppSite
    def self.matches?(request)
      if (request.host == "thomasite.dev")
        true
      else
        if request.subdomain == "dashboard"
5.times {          Rails.logger.info "Subdomain was dashboard!"  }
          true
        else
          5.times { Rails.logger.info "Subdomain was #{request.subdomain}" }
          false
        end
      end
    end
  end

end
