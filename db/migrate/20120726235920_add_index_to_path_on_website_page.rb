class AddIndexToPathOnWebsitePage < ActiveRecord::Migration
  def change
    add_index :website_pages, :path
  end
end
