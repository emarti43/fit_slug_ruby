class Exercise < ApplicationRecord
  has_many :exercise_records, inverse_of: :exercise
  has_many :exercise_muscles, inverse_of: :exercise
  validates :name, presence: true, allow_blank: false
end
