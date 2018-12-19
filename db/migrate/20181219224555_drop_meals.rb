class DropMeals < ActiveRecord::Migration[5.2]
  def change
    drop_table :meals
  end
end
