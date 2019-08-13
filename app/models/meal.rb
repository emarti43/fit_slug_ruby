class Meal < ApplicationRecord
  has_many :meal_records
  validates :kcal, presence: true
  validates :total_fat, presence: true
  validates :serving_size, presence: true, allow_blank: false
  validates :protein, presence: true
  validates :total_carb, presence: true
end
