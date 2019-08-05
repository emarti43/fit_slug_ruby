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
  describe 'POST #login' do
    context 'creating session' do
      it 'returns a token when login success' do
        payload = {
          user:
          {
            name: 'Example User',
            password: 'foobar'
          }
        }
        post '/api/login', params: payload
        expect(response.code).to eq("200")
        expect(response.body['token'].nil?).to be_falsy
      end
      it 'returns error when invalid password' do
        payload = {
          user:
          {
            name: 'Example User',
            password: 'ss'
          }
        }
        post '/api/login', params: payload
        expect(response.code).to eq("400")
        expect(response.body['token'].nil?).to be_truthy
      end
    end
    context 'creating username and session' do
      it 'returns a token upon signup success' do
        payload = {
          user:
          {
            name: 'binko',
            password: 'foobar',
            password_confirmation: 'foobar',
            email: 'something@gmail.com'
          }
        }
        post '/api/signup', params: payload
        expect(response.code).to eq("201")
        expect(response.body['token'].nil?).to be_falsy
      end
      it 'returns error upon signup failure' do
        payload = {
          user:
          {
            name: 'binko',
            password: 'foobar',
            password_confirmation: 'foobassr',
            email: 'something@gmail.com'
          }
        }
        post '/api/signup', params: payload
        expect(response.code).to eq("400")
        expect(response.body['token'].nil?).to be_truthy
      end
    end
  end
end
