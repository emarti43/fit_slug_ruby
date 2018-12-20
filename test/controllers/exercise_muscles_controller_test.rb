require 'test_helper'

class ExerciseMusclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_muscle = exercise_muscles(:one)
  end

  test "should get index" do
    get exercise_muscles_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_muscle_url
    assert_response :success
  end

  test "should create exercise_muscle" do
    assert_difference('ExerciseMuscle.count') do
      post exercise_muscles_url, params: { exercise_muscle: { e_id: @exercise_muscle.e_id, m_id: @exercise_muscle.m_id } }
    end

    assert_redirected_to exercise_muscle_url(ExerciseMuscle.last)
  end

  test "should show exercise_muscle" do
    get exercise_muscle_url(@exercise_muscle)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_muscle_url(@exercise_muscle)
    assert_response :success
  end

  test "should update exercise_muscle" do
    patch exercise_muscle_url(@exercise_muscle), params: { exercise_muscle: { e_id: @exercise_muscle.e_id, m_id: @exercise_muscle.m_id } }
    assert_redirected_to exercise_muscle_url(@exercise_muscle)
  end

  test "should destroy exercise_muscle" do
    assert_difference('ExerciseMuscle.count', -1) do
      delete exercise_muscle_url(@exercise_muscle)
    end

    assert_redirected_to exercise_muscles_url
  end
end
