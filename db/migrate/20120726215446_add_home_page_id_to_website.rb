class AddHomePageIdToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :homepage_id, :reference
  end
end
