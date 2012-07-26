class CreateWebsitePages < ActiveRecord::Migration
  def change
    create_table :website_pages do |t|
      t.string :title
      t.text :body_markdown
      t.text :body_html
      t.references :website
      t.string :path

      t.timestamps
    end
    add_index :website_pages, :website_id
  end
end
