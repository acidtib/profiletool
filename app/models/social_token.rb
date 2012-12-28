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

class SocialToken < ActiveRecord::Base
  belongs_to :website
  attr_accessible :preferences, :type
  serialize :preferences
end
