class WebsitePage < ActiveRecord::Base
  belongs_to :website
  attr_accessible :body_html, :body_markdown, :path, :title, :is_homepage
  validates_presence_of :title, :path, :body_markdown
  validates_uniqueness_of :path, :scope => [ :website_id ]
  
  before_save :generate_markdown

  def generate_markdown
    self.body_html = RDiscount.new(self.body_markdown).to_html
  end

end
