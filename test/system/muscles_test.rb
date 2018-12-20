require "application_system_test_case"

class MusclesTest < ApplicationSystemTestCase
  setup do
    @muscle = muscles(:one)
  end

  test "visiting the index" do
    visit muscles_url
    assert_selector "h1", text: "Muscles"
  end

  test "creating a Muscle" do
    visit muscles_url
    click_on "New Muscle"

    fill_in "Name", with: @muscle.name
    click_on "Create Muscle"

    assert_text "Muscle was successfully created"
    click_on "Back"
  end

  test "updating a Muscle" do
    visit muscles_url
    click_on "Edit", match: :first

    fill_in "Name", with: @muscle.name
    click_on "Update Muscle"

    assert_text "Muscle was successfully updated"
    click_on "Back"
  end

  test "destroying a Muscle" do
    visit muscles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Muscle was successfully destroyed"
  end
end
