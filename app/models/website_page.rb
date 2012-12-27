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

class WebsitePage < ActiveRecord::Base
  belongs_to :website
  attr_accessible :body_html, :body_markdown, :path, :title, :published
  validates_presence_of :title, :path, :body_markdown
  validates_uniqueness_of :path, :scope => [ :website_id ]
  
  before_save :generate_markdown

  def generate_markdown
    self.body_html = RDiscount.new(self.body_markdown).to_html
  end

end
