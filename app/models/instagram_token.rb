class InstagramToken < SocialToken

  def code=(code)
    if self.preferences.nil?
      self.preferences = {}
    end
    self.preferences[:code] = code
  end

  def code
    if !self.preferences.nil? 
      self.preferences[:code]
    end
  end

end
