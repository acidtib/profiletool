# == Schema Information
#
# Table name: social_tokens
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  website_id  :integer
#  preferences :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SocialTokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
