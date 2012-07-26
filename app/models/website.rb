class Website < ActiveRecord::Base
  belongs_to :user
  attr_accessible :domain, :website_pages_enabled
  has_many :website_pages
  
  def homepage
    if self.homepage_id
      self.website_pages.find(self.homepage_id)
    else
      nil
    end
  end

  def homepage=(page)
    self.homepage_id = page.id
  end

end
