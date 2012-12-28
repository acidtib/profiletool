# == Schema Information
#
# Table name: social_tokens
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  website_id  :integer
#  preferences :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
