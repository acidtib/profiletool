class Website < ActiveRecord::Base
  belongs_to :user
  attr_accessible :domain, :title, :website_pages_enabled
  has_many :website_pages
  
  def get_homepage
    begin 
      homepage = self.website_pages.find_by_path("index")
      homepage
    rescue Exception => e
      false
    end
  end

end
