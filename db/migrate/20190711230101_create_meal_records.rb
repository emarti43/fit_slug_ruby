class CreateMealRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_records do |t|
      t.belongs_to :user, index: true
      t.belongs_to :meal
      t.integer :num_servings

      t.timestamps
    end
  end
end
