class AddHomePageIdToWebsite < ActiveRecord::Migration
  def up
    add_column :websites, :homepage_id, :integer
  end
  def down
    remove_column :websites, :homepage_id
  end
end
