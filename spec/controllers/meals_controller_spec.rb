require 'rails_helper'
RSpec.describe Api::MealsController, type: :request do
  before(:each) { host! 'localhost:3000'}
  describe 'GET #index' do
    context 'with credentials' do
      user_id = 1
      it 'returns ok for valid user id' do
        get '/api/meals', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("200")
      end
    end
    context 'invalid credentials' do
      it 'returns ok if header not provided' do
        get '/api/meals'
        expect(response.code).to eq("200")
      end
      it 'returns ok with invalid' do
        user_id = 4 #there's only 2 user records
        get '/api/meals', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("200")
      end
    end
  end
  describe 'POST #create' do
    context 'with credentials' do
      it 'should save record with muscles' do
        post '/api/meals',
          params: {meal: {
            name: "Spam Fried Rice",
            kcal: 300,
            total_fat: 10,
            total_carb: 34,
            protein: 15
            }},
          headers: {'Authorization'=> JsonWebToken.encode(user_id: 1)}
        expect(response.code).to eq("201")
      end
    end
  end
end
