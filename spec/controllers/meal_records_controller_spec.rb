require 'rails_helper'
RSpec.describe Api::MealRecordsController, type: :request do
  before(:each) do
    host! 'localhost:3000'
    @valid_auth_header = { Authorization: JsonWebToken.encode(user_id: 1) }
    @valid_record_payload = {
      meal_record: {
        meal_id: 1,
        num_servings: 2
      }
    }
    @invalid_record_payload = {
      meal_record: {
        meal_id: 1,
        num_servings: ''
      }
    }
    @valid_update_payload = {
      meal_record: {
        num_servings: 2
      }
    }
  end
  describe 'GET #index' do
    context 'with credentials' do
      user_id = 1
      it 'returns records for valid user id' do
        get '/api/meal_records.json',
          params: nil,
          headers: @valid_auth_header
        records = JSON.parse(response.body)
        result = records.all? { |record| record['user_id'] == user_id } && !records.empty?
        expect(result).to be true
      end
    end
    context 'invalid credentials' do
      it 'returns unauthorized if header not provided' do
        get '/api/meal_records.json'
        expect(response.code).to eq("401")
      end
      it 'returns unauthorized if header has invalid user id' do
        user_id = -1
        get '/api/meal_records.json',
          params: nil,
          headers: { Authorization: JsonWebToken.encode(user_id: user_id) }
        expect(response.code).to eq("401")
      end
    end
  end

  describe 'POST #meal_records' do
    context 'with valid credentials' do
      it 'posts a meal record to corresponding user' do
        post '/api/meal_records',
          params: @valid_record_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("201")
      end
      it 'returns 422 with empty num_servings' do
        post '/api/meal_records',
          params: @invalid_record_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("422")
      end
    end
    context 'with invalid credentials' do
      user_id = 3
      it 'does not post when request has no auth' do
        post '/api/meal_records',
          params: @valid_record_payload
        expect(response.code).to eq("401")
      end
      it 'does not post when request has invalid id' do
        post '/api/meal_records',
          params: @valid_record_payload,
          headers: {Authorization: JsonWebToken.encode(user_id: 3)}
        expect(response.code).to eq("401")
      end
    end
  end

  describe 'PUT #meal_records/:id' do
    context 'with valid credentials' do
      meal_record_id = 1
      it 'updates meal_record that belongs to user' do
        put '/api/meal_records/' + meal_record_id.to_s,
          params: @valid_update_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      meal_record_id = 3
      it 'should not update when record does not belong to user' do
        put '/api/meal_records/' + meal_record_id.to_s,
          params: @valid_update_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("401")
      end
    end
  end

  describe 'DELETE #meal_records/:id' do
    meal_record_id = 1
    context 'with valid credentials' do
      it 'deletes record successfullly' do
        delete '/api/meal_records/' + meal_record_id.to_s,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      it 'returns unauthorized with different user_ids' do
        delete '/api/meal_records/' + meal_record_id.to_s,
          headers: { Authorization: JsonWebToken.encode(user_id: 2) }
        expect(response.code).to eq("401")
      end
    end
  end
end
