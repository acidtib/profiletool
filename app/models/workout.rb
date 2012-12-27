# == Schema Information
#
# Table name: workouts
#
#  id              :integer          not null, primary key
#  workout_type    :string(255)
#  workout_time    :datetime
#  intensity       :integer
#  length_or_count :string(255)
#  comments        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Workout < ActiveRecord::Base
  attr_accessible :comments, :intensity, :length_or_count, :workout_type, :workout_time
end
