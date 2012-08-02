class AddBlogEnableToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :website_blog_enabled, :boolean
  end
end
