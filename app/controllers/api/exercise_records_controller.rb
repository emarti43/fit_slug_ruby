module Api
  class ExerciseRecordsController < ApplicationController
    before_action :set_exercise_record, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:index, :create, :destroy]

    # GET /exercise_records
    # GET /exercise_records.json
    def index
      @exercise_records = ExerciseRecord.all.where("user_id = #{@user.id}")
      render json: @exercise_records.map{ |record| {exercise_name: Exercise.find(record.exercise_id).name, exercise_record: record} }.to_json(), status: :ok
    end

    # GET /exercise_records/1
    # GET /exercise_records/1.json
    def show
    end

    # GET /exercise_records/new
    def new
      @exercise_record = ExerciseRecord.new
    end

    # GET /exercise_records/1/edit
    def edit
    end

    # POST /exercise_records
    def create
      @exercise_record = ExerciseRecord.new(exercise_record_params)
      if @exercise_record.save
        render json: {messsage: 'created successfully'}, status: :created
      else
        render json: @exercise_record.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /exercise_records/1
    # PATCH/PUT /exercise_records/1.json
    def update
      respond_to do |format|
        if @exercise_record.update(exercise_record_params)
          format.html { redirect_to @exercise_record, notice: 'Exercise record was successfully updated.' }
          format.json { render :show, status: :ok, location: @exercise_record }
        else
          format.html { render :edit }
          format.json { render json: @exercise_record.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /exercise_records/exercise_record.id
    def destroy
      if @user.id != @exercise_record.user_id
        puts "#{@user.id}, #{@exercise_record.user_id}"
        render json: {message: 'invalid credentials'}, status: :unauthorized and return
      end
      @exercise_record.destroy
      render json: {}, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_exercise_record
        @exercise_record = ExerciseRecord.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def exercise_record_params
        params.require(:exercise_record).permit(:user_id, :exercise_id, :num_reps, :weight, :num_sets)
      end
  end
end
