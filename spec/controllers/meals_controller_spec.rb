require 'rails_helper'
RSpec.describe Api::MealsController, type: :request do
  before(:each) do
    host! 'localhost:3000'
    @valid_auth_header = { Authorization: JsonWebToken.encode(user_id: 1) }
    @valid_meal_payload = {
      meal: {
        name: "Spam Fried Rice",
        kcal: 300,
        total_fat: 10,
        total_carb: 34,
      }
    }
  end
  describe 'GET #index' do
    context 'with credentials' do
      user_id = 1
      it 'returns ok for valid user id' do
        get '/api/meals',
          params: nil,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
      end
    end
    context 'invalid credentials' do
      it 'returns ok if header not provided' do
        get '/api/meals'
        expect(response.code).to eq("200")
      end
      it 'returns ok with invalid' do
        get '/api/meals',
          params: nil,
          headers: { Authorization: JsonWebToken.encode(user_id: -1) }
        expect(response.code).to eq("200")
      end
    end
  end
  describe 'POST #create' do
    context 'with credentials' do
      it 'not save with empty protein field' do
        post '/api/meals',
          params: @valid_meal_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("422")
      end
    end
  end
end
