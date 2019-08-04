class Exercise < ApplicationRecord
  has_many :exercise_records, inverse_of: :exercise
  has_many :exercise_muscles, foreign_key: "e_id", inverse_of: :exercise
end
