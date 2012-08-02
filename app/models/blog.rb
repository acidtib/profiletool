class Blog < ActiveRecord::Base
  attr_accessible :website_blog_enabled
  has_many :posts
end
