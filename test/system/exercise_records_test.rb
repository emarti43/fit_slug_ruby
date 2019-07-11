require "application_system_test_case"

class ExerciseRecordsTest < ApplicationSystemTestCase
  setup do
    @exercise_record = exercise_records(:one)
  end

  test "visiting the index" do
    visit exercise_records_url
    assert_selector "h1", text: "Exercise Records"
  end

  test "creating a Exercise record" do
    visit exercise_records_url
    click_on "New Exercise Record"

    fill_in "Exercise", with: @exercise_record.exercise_id
    fill_in "Num reps", with: @exercise_record.num_reps
    fill_in "Num sets", with: @exercise_record.num_sets
    fill_in "User", with: @exercise_record.user_id
    fill_in "Weight", with: @exercise_record.weight
    click_on "Create Exercise record"

    assert_text "Exercise record was successfully created"
    click_on "Back"
  end

  test "updating a Exercise record" do
    visit exercise_records_url
    click_on "Edit", match: :first

    fill_in "Exercise", with: @exercise_record.exercise_id
    fill_in "Num reps", with: @exercise_record.num_reps
    fill_in "Num sets", with: @exercise_record.num_sets
    fill_in "User", with: @exercise_record.user_id
    fill_in "Weight", with: @exercise_record.weight
    click_on "Update Exercise record"

    assert_text "Exercise record was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise record" do
    visit exercise_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise record was successfully destroyed"
  end
end
