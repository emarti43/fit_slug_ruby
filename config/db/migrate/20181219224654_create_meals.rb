class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :serving_size
      t.integer :kcal
      t.integer :total_fat
      t.integer :sat_fat
      t.integer :polyun_fat
      t.integer :monoun_fat
      t.integer :cholesterol
      t.integer :sodium
      t.integer :potassium
      t.integer :total_carb
      t.integer :fiber
      t.integer :sugar
      t.integer :protein
      t.integer :vitamin_a
      t.integer :calcium
      t.integer :vitamin_d
      t.integer :vitamin_c
      t.integer :iron
      t.integer :magnesium
      t.integer :cobalamin
      t.integer :vitamin_b6

      t.timestamps
    end
  end
end
