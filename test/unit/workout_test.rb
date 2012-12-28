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

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
