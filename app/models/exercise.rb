class Exercise < ApplicationRecord
  has_many :exercise_records
  has_many :exercise_muscles, foreign_key: "e_id"
end
