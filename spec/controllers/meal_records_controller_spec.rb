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
end
