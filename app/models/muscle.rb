class Muscle < ApplicationRecord
  has_many :exercise_muscles, foreign_key: "m_id"
end
