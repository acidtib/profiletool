class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
