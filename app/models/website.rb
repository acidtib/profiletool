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

class Website < ActiveRecord::Base
  belongs_to :user
  attr_accessible :domain, :title, :custom_css, :website_pages_enabled, :website_blog_enabled
  has_many :website_pages
  has_one :blog
  has_one :instagram_token

  def get_homepage
    begin 
      homepage = self.website_pages.find_by_path("index")
      homepage
    rescue Exception => e
      false
    end
  end

end
