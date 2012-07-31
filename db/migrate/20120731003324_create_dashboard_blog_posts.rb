class CreateDashboardBlogPosts < ActiveRecord::Migration
  def change
    create_table :dashboard_blog_posts do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
