require "application_system_test_case"

class ExerciseMusclesTest < ApplicationSystemTestCase
  setup do
    @exercise_muscle = exercise_muscles(:one)
  end

  test "visiting the index" do
    visit exercise_muscles_url
    assert_selector "h1", text: "Exercise Muscles"
  end

  test "creating a Exercise muscle" do
    visit exercise_muscles_url
    click_on "New Exercise Muscle"

    fill_in "E", with: @exercise_muscle.e_id
    fill_in "M", with: @exercise_muscle.m_id
    click_on "Create Exercise muscle"

    assert_text "Exercise muscle was successfully created"
    click_on "Back"
  end

  test "updating a Exercise muscle" do
    visit exercise_muscles_url
    click_on "Edit", match: :first

    fill_in "E", with: @exercise_muscle.e_id
    fill_in "M", with: @exercise_muscle.m_id
    click_on "Update Exercise muscle"

    assert_text "Exercise muscle was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise muscle" do
    visit exercise_muscles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise muscle was successfully destroyed"
  end
end
