require 'rails_helper'
RSpec.describe Api::MealRecordsController, type: :request do
  before(:each) { host! 'localhost:3000'}
  describe 'GET #index' do
    context 'with credentials' do
      user_id = 1
      it 'returns records for valid user id' do
        get '/api/meal_records.json', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        result = JSON.parse(response.body).all? { |record| record['user_id'] == user_id }
        expect(result).to be true
      end
    end
    context 'invalid credentials' do
      it 'returns unauthorized if header not provided' do
        get '/api/meal_records.json'
        expect(response.code).to eq("401")
      end
      it 'returns unauthorized if header has invalid user id' do
        user_id = 4 #there's only 2 user records
        get '/api/meal_records.json', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("401")
      end
    end
  end
  describe 'POST #meal_records' do
    context 'with valid credentials' do
      user_id = 1
      meal_id = 1
      it 'posts a meal record to corresponding user' do
        post '/api/meal_records', params: {meal_record: {user_id: user_id, meal_id: meal_id, num_servings: 2 }}, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("201")
      end
    end
    context 'with invalid credentials' do
      user_id = -1
      meal_id = 1
      it 'does not post when request has no auth' do
        post '/api/meal_records', params: {meal_record: {user_id: user_id, meal_id: meal_id, num_servings: 2 }}
        expect(response.code).to eq("401")
      end
      it 'does not post when request has invalid id' do
        post '/api/meal_records', params: {meal_record: {user_id: user_id, meal_id: meal_id, num_servings: 2 }}, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("401")
      end
    end
  end
  describe 'DELETE #exericse_records/exericse_record.id' do

    meal_record_id = 1
    context 'with valid credentials' do
      it 'deletes record successfullly' do
        user_id = 1
        delete '/api/meal_records/' + meal_record_id.to_s, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      it 'returns unauthorized with different user_ids' do
        user_id = 2
        delete '/api/meal_records/' + meal_record_id.to_s, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("401")
      end
    end
  end
end
