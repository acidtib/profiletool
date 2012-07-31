class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text
  belongs_to :post, :class_name => "Dashboard::Blog::Post"
end
