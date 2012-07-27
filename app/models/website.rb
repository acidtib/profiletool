class Website < ActiveRecord::Base
  belongs_to :user
  attr_accessible :domain, :website_pages_enabled
  has_many :website_pages
 end
