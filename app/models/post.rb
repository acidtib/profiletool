class Post < ActiveRecord::Base
  #belongs_to :user, :blog, :website
  attr_accessible :text, :title
  has_many :comments
end
