class SocialToken < ActiveRecord::Base
  belongs_to :website
  attr_accessible :preferences, :type
  serialize :preferences
end
