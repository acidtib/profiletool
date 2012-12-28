# == Schema Information
#
# Table name: websites
#
#  id                    :integer          not null, primary key
#  domain                :string(255)
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  website_pages_enabled :boolean          default(FALSE)
#  homepage_id           :integer
#  title                 :string(255)      default("My Great Website")
#  website_blog_enabled  :boolean
#  custom_css            :text
#

require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
