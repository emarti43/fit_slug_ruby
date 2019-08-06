require 'rails_helper'
RSpec.describe Api::ExercisesController, type: :request do
  before(:each) { host! 'localhost:3000'}
  describe 'GET #index' do
    context 'with credentials' do
      user_id = 1
      it 'returns ok for valid user id' do
        get '/api/exercises', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("200")
        workout_muscles = JSON.parse(response.body).all? {|entry| entry['muscles'].nil? == false && !entry['muscles'].empty?}
        expect(workout_muscles).to be_truthy
      end
    end
    context 'invalid credentials' do
      it 'returns ok if header not provided' do
        get '/api/exercises'
        expect(response.code).to eq("200")
      end
      it 'returns ok with invalid' do
        user_id = 4 #there's only 2 user records
        get '/api/exercises',
          params: nil,
          headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("200")
      end
    end
  end
  describe 'POST #create' do
    context 'with credentials' do
      it 'should save record with muscles' do
        payload = {
          exercise:
          {
            name: "Lateral Raise",
            muscles: [3, 2, 5]
          }
        }
        post '/api/exercises',
          params: payload,
          headers: {'Authorization'=> JsonWebToken.encode(user_id: 1)}
        expect(response.code).to eq("201")
      end
    end
  end
  describe 'POST #update' do
    context 'with credentials' do
      it 'should update record with muscles' do
        payload = {
          exercise:
          {
            name: "Lateral Raise",
            muscles: [3, 2, 5]
          }
        }
        put '/api/exercises/' + 1.to_s,
          params: payload,
          headers: {'Authorization'=> JsonWebToken.encode(user_id: 1)}
        expect(response.code).to eq("200")
      end
    end
  end
end
