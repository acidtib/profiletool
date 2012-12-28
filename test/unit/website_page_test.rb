# == Schema Information
#
# Table name: website_pages
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  body_markdown :text
#  body_html     :text
#  website_id    :integer
#  path          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  published     :boolean          default(TRUE)
#

require 'test_helper'

class WebsitePageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
