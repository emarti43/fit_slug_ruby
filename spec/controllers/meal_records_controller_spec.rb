require 'rails_helper'
RSpec.describe Api::MealRecordsController, type: :request do
  before(:each) { host! 'localhost:3000'}
  describe 'GET #index' do
    context 'with credentials' do
      user_id = 1
      it 'returns records that belong to user' do
        get '/api/meal_records.json', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        result = JSON.parse(response.body).all? { |record| record['user_id'] == user_id }
        expect(result).to be true
      end
    end
  end
end
