require "application_system_test_case"

class MealsTest < ApplicationSystemTestCase
  setup do
    @meal = meals(:one)
  end

  test "visiting the index" do
    visit meals_url
    assert_selector "h1", text: "Meals"
  end

  test "creating a Meal" do
    visit meals_url
    click_on "New Meal"

    fill_in "Calcium", with: @meal.calcium
    fill_in "Cholesterol", with: @meal.cholesterol
    fill_in "Cobalamin", with: @meal.cobalamin
    fill_in "Fiber", with: @meal.fiber
    fill_in "Iron", with: @meal.iron
    fill_in "Kcal", with: @meal.kcal
    fill_in "Magnesium", with: @meal.magnesium
    fill_in "Monoun fat", with: @meal.monoun_fat
    fill_in "Name", with: @meal.name
    fill_in "Polyun fat", with: @meal.polyun_fat
    fill_in "Potassium", with: @meal.potassium
    fill_in "Protein", with: @meal.protein
    fill_in "Sat fat", with: @meal.sat_fat
    fill_in "Serving size", with: @meal.serving_size
    fill_in "Sodium", with: @meal.sodium
    fill_in "Sugar", with: @meal.sugar
    fill_in "Total carb", with: @meal.total_carb
    fill_in "Total fat", with: @meal.total_fat
    fill_in "Vitamin a", with: @meal.vitamin_a
    fill_in "Vitamin b6", with: @meal.vitamin_b6
    fill_in "Vitamin c", with: @meal.vitamin_c
    fill_in "Vitamin d", with: @meal.vitamin_d
    click_on "Create Meal"

    assert_text "Meal was successfully created"
    click_on "Back"
  end

  test "updating a Meal" do
    visit meals_url
    click_on "Edit", match: :first

    fill_in "Calcium", with: @meal.calcium
    fill_in "Cholesterol", with: @meal.cholesterol
    fill_in "Cobalamin", with: @meal.cobalamin
    fill_in "Fiber", with: @meal.fiber
    fill_in "Iron", with: @meal.iron
    fill_in "Kcal", with: @meal.kcal
    fill_in "Magnesium", with: @meal.magnesium
    fill_in "Monoun fat", with: @meal.monoun_fat
    fill_in "Name", with: @meal.name
    fill_in "Polyun fat", with: @meal.polyun_fat
    fill_in "Potassium", with: @meal.potassium
    fill_in "Protein", with: @meal.protein
    fill_in "Sat fat", with: @meal.sat_fat
    fill_in "Serving size", with: @meal.serving_size
    fill_in "Sodium", with: @meal.sodium
    fill_in "Sugar", with: @meal.sugar
    fill_in "Total carb", with: @meal.total_carb
    fill_in "Total fat", with: @meal.total_fat
    fill_in "Vitamin a", with: @meal.vitamin_a
    fill_in "Vitamin b6", with: @meal.vitamin_b6
    fill_in "Vitamin c", with: @meal.vitamin_c
    fill_in "Vitamin d", with: @meal.vitamin_d
    click_on "Update Meal"

    assert_text "Meal was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal" do
    visit meals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal was successfully destroyed"
  end
end
