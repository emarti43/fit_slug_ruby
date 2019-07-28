require 'rails_helper'

RSpec.describe Api::SessionsController, type: :request do
  before(:each) { host! 'localhost:3000' }
  describe 'GET #validate' do
    context 'invalid token' do
      it 'returns nil if token is nil' do
        get '/api/validate'
        expect(response).to have_http_status(:bad_request)
      end
    end
    context 'valid token'
      it 'returns ok if token has valid id' do
        get '/api/validate', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: 1)}
        expect(response.code).to eq("200")
      end
      it 'returns error if token has valid id' do
        get '/api/validate', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: -1)}
        expect(response.code).to eq("400")
      end
  end
end
