require "application_system_test_case"

class MealRecordsTest < ApplicationSystemTestCase
  setup do
    @meal_record = meal_records(:one)
  end

  test "visiting the index" do
    visit meal_records_url
    assert_selector "h1", text: "Meal Records"
  end

  test "creating a Meal record" do
    visit meal_records_url
    click_on "New Meal Record"

    fill_in "Meal", with: @meal_record.meal_id
    fill_in "Num servings", with: @meal_record.num_servings
    fill_in "User", with: @meal_record.user_id
    click_on "Create Meal record"

    assert_text "Meal record was successfully created"
    click_on "Back"
  end

  test "updating a Meal record" do
    visit meal_records_url
    click_on "Edit", match: :first

    fill_in "Meal", with: @meal_record.meal_id
    fill_in "Num servings", with: @meal_record.num_servings
    fill_in "User", with: @meal_record.user_id
    click_on "Update Meal record"

    assert_text "Meal record was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal record" do
    visit meal_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal record was successfully destroyed"
  end
end
