require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal = meals(:one)
  end

  test "should get index" do
    get meals_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_url
    assert_response :success
  end

  test "should create meal" do
    assert_difference('Meal.count') do
      post meals_url, params: { meal: { calcium: @meal.calcium, cholesterol: @meal.cholesterol, cobalamin: @meal.cobalamin, fiber: @meal.fiber, iron: @meal.iron, kcal: @meal.kcal, magnesium: @meal.magnesium, monoun_fat: @meal.monoun_fat, name: @meal.name, polyun_fat: @meal.polyun_fat, potassium: @meal.potassium, protein: @meal.protein, sat_fat: @meal.sat_fat, serving_size: @meal.serving_size, sodium: @meal.sodium, sugar: @meal.sugar, total_carb: @meal.total_carb, total_fat: @meal.total_fat, vitamin_a: @meal.vitamin_a, vitamin_b6: @meal.vitamin_b6, vitamin_c: @meal.vitamin_c, vitamin_d: @meal.vitamin_d } }
    end

    assert_redirected_to meal_url(Meal.last)
  end

  test "should show meal" do
    get meal_url(@meal)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_url(@meal)
    assert_response :success
  end

  test "should update meal" do
    patch meal_url(@meal), params: { meal: { calcium: @meal.calcium, cholesterol: @meal.cholesterol, cobalamin: @meal.cobalamin, fiber: @meal.fiber, iron: @meal.iron, kcal: @meal.kcal, magnesium: @meal.magnesium, monoun_fat: @meal.monoun_fat, name: @meal.name, polyun_fat: @meal.polyun_fat, potassium: @meal.potassium, protein: @meal.protein, sat_fat: @meal.sat_fat, serving_size: @meal.serving_size, sodium: @meal.sodium, sugar: @meal.sugar, total_carb: @meal.total_carb, total_fat: @meal.total_fat, vitamin_a: @meal.vitamin_a, vitamin_b6: @meal.vitamin_b6, vitamin_c: @meal.vitamin_c, vitamin_d: @meal.vitamin_d } }
    assert_redirected_to meal_url(@meal)
  end

  test "should destroy meal" do
    assert_difference('Meal.count', -1) do
      delete meal_url(@meal)
    end

    assert_redirected_to meals_url
  end
end
