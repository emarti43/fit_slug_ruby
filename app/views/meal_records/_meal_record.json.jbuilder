json.extract! meal_record, :id, :user_id, :meal_id, :num_servings, :created_at, :updated_at
json.url meal_record_url(meal_record, format: :json)
