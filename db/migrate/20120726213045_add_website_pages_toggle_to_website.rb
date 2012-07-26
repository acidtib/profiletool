class AddWebsitePagesToggleToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :website_pages_enabled, :boolean, :default => false
  end
end
