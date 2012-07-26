class WebsitePage < ActiveRecord::Base
  belongs_to :website
  attr_accessible :body_html, :body_markdown, :path, :title, :is_homepage
  attr_accessor :is_homepage

  before_save :update_homepage

  def is_homepage
    @homepage
  end

  def is_homepage=(bool)
    @homepage = bool
  end

  def update_homepage
    if self.is_homepage
      website = self.website
      website.homepage=(self)
      website.save
    end
  end
end
