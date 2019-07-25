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
  end
end
