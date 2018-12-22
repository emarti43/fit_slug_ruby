class CreateExerciseMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_muscles do |t|
      t.integer :e_id
      t.integer :m_id

      t.timestamps
    end
  end
end
