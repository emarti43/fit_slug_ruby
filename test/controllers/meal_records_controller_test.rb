require 'test_helper'

class MealRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_record = meal_records(:one)
  end

  test "should get index" do
    get meal_records_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_record_url
    assert_response :success
  end

  test "should create meal_record" do
    assert_difference('MealRecord.count') do
      post meal_records_url, params: { meal_record: { meal_id: @meal_record.meal_id, num_servings: @meal_record.num_servings, user_id: @meal_record.user_id } }
    end

    assert_redirected_to meal_record_url(MealRecord.last)
  end

  test "should show meal_record" do
    get meal_record_url(@meal_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_record_url(@meal_record)
    assert_response :success
  end

  test "should update meal_record" do
    patch meal_record_url(@meal_record), params: { meal_record: { meal_id: @meal_record.meal_id, num_servings: @meal_record.num_servings, user_id: @meal_record.user_id } }
    assert_redirected_to meal_record_url(@meal_record)
  end

  test "should destroy meal_record" do
    assert_difference('MealRecord.count', -1) do
      delete meal_record_url(@meal_record)
    end

    assert_redirected_to meal_records_url
  end
end
