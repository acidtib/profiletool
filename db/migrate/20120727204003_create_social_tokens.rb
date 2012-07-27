class CreateSocialTokens < ActiveRecord::Migration
  def change
    create_table :social_tokens do |t|
      t.string :type
      t.references :website
      t.text :preferences

      t.timestamps
    end
    add_index :social_tokens, :website_id
  end
end
