class MealRecord < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  validates :num_servings, presence: true, allow_blank: false
end
