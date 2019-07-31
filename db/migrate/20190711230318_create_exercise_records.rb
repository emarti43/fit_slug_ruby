class CreateExerciseRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_records do |t|
      t.belongs_to :user, index: true
      t.belongs_to :exercise, index: true
      t.integer :num_reps
      t.integer :weight
      t.integer :num_sets

      t.timestamps
    end
  end
end
