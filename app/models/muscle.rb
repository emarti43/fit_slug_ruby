class Muscle < ApplicationRecord
  has_many :exercise_muscles, foreign_key: "m_id"
  validates :name, presence: true, allow_blank: false
end
