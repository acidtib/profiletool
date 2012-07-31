class Dashboard::Blog::Post < ActiveRecord::Base
  attr_accessible :text, :title
  has_many :comments
end
