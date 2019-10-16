class CreateExerciseMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_muscles do |t|
      t.belongs_to :exercise, index: true, foreign_key: "e_id"
      t.belongs_to :muscle, index: true, foreign_key: "m_id"
      t.timestamps
    end
  end
end
