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
end
