json.extract! exercise_record, :id, :user_id, :exercise_id, :num_reps, :weight, :num_sets, :created_at, :updated_at
json.url exercise_record_url(exercise_record, format: :json)
