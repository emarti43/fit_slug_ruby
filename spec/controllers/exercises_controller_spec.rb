require 'rails_helper'
RSpec.describe Api::ExercisesController, type: :request do
  before(:each) do
    host! 'localhost:3000'
    @valid_auth_header = { Authorization: JsonWebToken.encode(user_id: 1) }
    @invalid_auth_header = { Authorization: JsonWebToken.encode(user_id: -1) }
    @valid_payload = {
      exercise:
      {
        name: "Lateral Raise",
        muscles: [3, 2, 5]
      }
    }
    @invalid_payload = {
      exercise:
      {
        name: "",
        muscles: [2, 3]
      }
    }
  end

  describe 'GET #index' do
    context 'with credentials' do
      it 'returns ok for valid user id' do
        get '/api/exercises',
          params: nil,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
        workout_muscles = JSON.parse(response.body).all? { |entry| entry['muscles'].nil? == false && !entry['muscles'].empty? }
        expect(workout_muscles).to be_truthy
      end
    end

    context 'invalid credentials' do
      it 'returns ok if header not provided' do
        get '/api/exercises'
        expect(response.code).to eq("200")
      end
      it 'returns ok with invalid' do
        get '/api/exercises',
          params: nil,
          headers: { Authorization: JsonWebToken.encode(user_id: 4) }
        expect(response.code).to eq("200")
      end
    end
  end
  
  describe 'POST #create' do
    context 'with credentials' do
      it 'should save record with muscles' do
        post '/api/exercises',
          params: @valid_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("201")
      end
    end
    context 'with credentials' do
      it 'return 422 with empty name' do
        post '/api/exercises',
          params: @invalid_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("422")
      end
    end
  end
  describe 'POST #update' do
    context 'with credentials' do
      it 'should update record with muscles' do
        put '/api/exercises/' + 1.to_s,
          params: @valid_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
      end
    end
  end
end
