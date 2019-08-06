require 'rails_helper'
RSpec.describe Api::ExerciseRecordsController, type: :request do
  before(:each) { host! 'localhost:3000'}
  describe 'GET #index' do
    context 'with valid credentials' do
      user_id = 1
      it 'returns records that belong to user' do
        get '/api/exercise_records.json', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        records = JSON.parse(response.body)
        result = records.all? { |record|  !record.empty?}
        expect(result).to be true
      end
    end
    context 'invalid credentials' do
      it 'returns unauthorized if header not provided' do
        get '/api/exercise_records.json'
        expect(response.code).to eq("401")
      end
      it 'returns unauthorized if header has invalid user id' do
        user_id = 4 #there's only 2 user records
        get '/api/exercise_records.json', params: nil, headers: {'Authorization' => JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("401")
      end
    end
  end
  describe 'POST #exercise_records' do
    context 'with valid credentials' do
      user_id = 1
      exercise_id = 1
      it 'posts a meal record to corresponding user' do
        post '/api/exercise_records', params: {exercise_record: {exercise_id: exercise_id, num_reps: 12, weight: 20, num_sets: 3}}, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("201")
      end
    end
    context 'with invalid credentials' do
      user_id = -1
      exercise_id = 1
      it 'does not post when request has no auth' do
        post '/api/exercise_records', params: {exercise_record: { exercise_id: exercise_id, num_reps: 12, weight: 20, num_sets: 3}}
        expect(response.code).to eq("401")
      end
      it 'does not post when request has invalid id' do
        post '/api/exercise_records', params: {exercise_record: { exercise_id: exercise_id, num_reps: 12, weight: 20, num_sets: 3}}, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("401")
      end
    end
  end

  describe 'PUT #exercise_records/:id' do
    context 'with valid credentials' do
      it 'updates exercise record that belongs to user' do
        put '/api/exercise_records/' + 1.to_s, params: { exercise_record: {num_reps: 6}}, headers: {Authorization: JsonWebToken.encode(user_id: 1)}
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      it 'should not update when record does not belong to user' do
        put '/api/exercise_records/' + 3.to_s, params: {exercise_record: {num_reps: 6}}, headers: {Authorization: JsonWebToken.encode(user_id: 1)}
        expect(response.code).to eq("401")
      end
    end
  end

  describe 'DELETE #exericse_records/exericse_record.id' do
    exercise_record_id = 1
    context 'with valid credentials' do
      it 'deletes record successfullly' do
        user_id = 1
        delete '/api/exercise_records/' + exercise_record_id.to_s, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      it 'returns unauthorized with different user_ids' do
        user_id = 2
        delete '/api/exercise_records/' + exercise_record_id.to_s, headers: {Authorization: JsonWebToken.encode(user_id: user_id)}
        expect(response.code).to eq("401")
      end
    end
  end

end
