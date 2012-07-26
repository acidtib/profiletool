class Website < ActiveRecord::Base
  belongs_to :user
  attr_accessible :domain
end
