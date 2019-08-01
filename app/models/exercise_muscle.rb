class ExerciseMuscle < ApplicationRecord
  belongs_to :muscle, foreign_key: "m_id"
  belongs_to :exercise, foreign_key: "e_id"
end
