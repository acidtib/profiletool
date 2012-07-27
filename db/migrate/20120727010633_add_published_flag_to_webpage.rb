class AddPublishedFlagToWebpage < ActiveRecord::Migration
  def change
    add_column :website_pages, :published, :boolean, :default => true
  end
end
