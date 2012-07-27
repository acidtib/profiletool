class AddTitleStringToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :title, :string, :default => "My Great Website"
  end
end
