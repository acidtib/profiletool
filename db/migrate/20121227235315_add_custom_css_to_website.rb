class AddCustomCssToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :custom_css, :text
  end
end
