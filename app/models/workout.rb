class Workout < ActiveRecord::Base
  attr_accessible :comments, :intensity, :length, :type
end
