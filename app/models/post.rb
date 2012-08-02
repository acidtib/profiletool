class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  belongs_to :website
  attr_accessible :text, :title
  has_many :comments
end
