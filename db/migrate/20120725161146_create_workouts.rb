class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :workout_type
      t.datetime :workout_time
      t.integer :intensity
      t.string :length_or_count
      t.text :comments

      t.timestamps
    end
  end
end
