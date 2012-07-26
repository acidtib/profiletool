class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :domain
      t.references :user

      t.timestamps
    end
    add_index :websites, :user_id
  end
end
