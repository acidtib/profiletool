class Blog < ActiveRecord::Base
  attr_accessible :website_blog_enabled
  belongs_to :website
  has_many :posts
end
