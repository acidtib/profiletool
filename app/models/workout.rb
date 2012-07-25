class Workout < ActiveRecord::Base
  attr_accessible :comments, :intensity, :length_or_count, :workout_type, :workout_time
end
