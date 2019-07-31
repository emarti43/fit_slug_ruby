class CreateExerciseMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_muscles do |t|
      t.belongs_to :exercise, index: true
      t.belongs_to :muscle, index: true

      t.timestamps
    end
  end
end
