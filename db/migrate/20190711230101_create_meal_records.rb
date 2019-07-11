class CreateMealRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_records do |t|
      t.integer :user_id
      t.integer :meal_id
      t.integer :num_servings

      t.timestamps
    end
  end
end
