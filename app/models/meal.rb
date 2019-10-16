class Meal < ApplicationRecord
  has_many :meal_records
  validates :kcal, presence: true
  validates :total_fat, presence: true
  validates :serving_size, presence: true, allow_blank: false
  validates :protein, presence: true
  validates :total_carb, presence: true
  before_destroy :destroy_all_records

  private

  def destroy_all_records
    self.meal_records.destroy_all
  end
end
