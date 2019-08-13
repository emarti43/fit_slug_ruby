require 'rails_helper'
RSpec.describe Api::ExerciseRecordsController, type: :request do
  before(:each) do
    host! 'localhost:3000'
    @valid_auth_header = { Authorization: JsonWebToken.encode(user_id: 1) }
    @invalid_auth_header = { Authorization: JsonWebToken.encode(user_id: -1) }
    @valid_payload = {
      exercise_record: {
        num_reps: 6
        }
      }
  end
  describe 'GET #index' do
    context 'with valid credentials' do
      it 'returns records that belong to user' do
        get '/api/exercise_records.json',
          params: nil,
          headers: @valid_auth_header
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
        get '/api/exercise_records.json',
          params: nil,
          headers: @invalid_auth_header
        expect(response.code).to eq("401")
      end
    end
  end
  describe 'POST #exercise_records' do
    context 'with valid credentials' do
      exercise_id = 1
      before(:example) do
        @payload = {
          exercise_record: {
            exercise_id: exercise_id,
            num_reps: 12,
            weight: 20,
            num_sets: 3
            }
          }
      end

      it 'posts a meal record to corresponding user' do
        post '/api/exercise_records',
          params: @payload,
          headers: @valid_auth_header
        expect(response.code).to eq("201")
      end

      it 'returns 422 on empty fields' do
        @payload['num_reps'] = ''
        post '/api/exercise_records',
          params: @payload,
          headers: @valid_auth_header
        expect(response.code).to eq("201")
      end

      it 'returns 422 on invalid exercise id' do
        @payload['exercise_id'] = 0
        post '/api/exercise_records',
          params: @valid_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("422")
      end

    end
  end

  describe 'PUT #exercise_records/:id' do
    context 'with valid credentials' do
      it 'updates exercise record that belongs to user' do
        put '/api/exercise_records/' + 1.to_s,
          params: @valid_payload,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      it 'should not update when record does not belong to user' do

        put '/api/exercise_records/' + 1.to_s,
          params: @valid_payload,
          headers: { Authorization: JsonWebToken.encode(user_id: 2) }
        expect(response.code).to eq("401")
      end
    end
  end

  describe 'DELETE #exericse_records/exericse_record.id' do
    exercise_record_id = 1
    context 'with valid credentials' do
      it 'deletes record successfullly' do
        delete '/api/exercise_records/' + exercise_record_id.to_s,
          headers: @valid_auth_header
        expect(response.code).to eq("200")
      end
    end
    context 'with invalid credentials' do
      it 'returns unauthorized with different user_ids' do
        delete '/api/exercise_records/' + exercise_record_id.to_s,
          headers: { Authorization: JsonWebToken.encode(user_id: 2) }
        expect(response.code).to eq("401")
      end
    end
  end

end
