require 'test_helper'

class ExerciseRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_record = exercise_records(:one)
  end

  test "should get index" do
    get exercise_records_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_record_url
    assert_response :success
  end

  test "should create exercise_record" do
    assert_difference('ExerciseRecord.count') do
      post exercise_records_url, params: { exercise_record: { exercise_id: @exercise_record.exercise_id, num_reps: @exercise_record.num_reps, num_sets: @exercise_record.num_sets, user_id: @exercise_record.user_id, weight: @exercise_record.weight } }
    end

    assert_redirected_to exercise_record_url(ExerciseRecord.last)
  end

  test "should show exercise_record" do
    get exercise_record_url(@exercise_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_record_url(@exercise_record)
    assert_response :success
  end

  test "should update exercise_record" do
    patch exercise_record_url(@exercise_record), params: { exercise_record: { exercise_id: @exercise_record.exercise_id, num_reps: @exercise_record.num_reps, num_sets: @exercise_record.num_sets, user_id: @exercise_record.user_id, weight: @exercise_record.weight } }
    assert_redirected_to exercise_record_url(@exercise_record)
  end

  test "should destroy exercise_record" do
    assert_difference('ExerciseRecord.count', -1) do
      delete exercise_record_url(@exercise_record)
    end

    assert_redirected_to exercise_records_url
  end
end
