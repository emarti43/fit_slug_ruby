class CreateExerciseRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_records do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.integer :num_reps
      t.integer :weight
      t.integer :num_sets

      t.timestamps
    end
  end
end
