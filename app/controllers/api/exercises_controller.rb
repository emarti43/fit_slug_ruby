module Api
  class ExercisesController < ApplicationController
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:create, :update, :destroy]

    # GET /exercises
    def index
      @exercises = Exercise.all
      list = @exercises.map{ |record| {exercise: record, muscles: record.exercise_muscles.map{ |exercise_muscles| exercise_muscles.muscle } } }
      render json: list, status: :ok
    end

    # POST /exercises
    def create
      @exercise = Exercise.new(exercise_params)
      if @exercise.save
        params[:exercise][:muscles].each do |muscle_id|
          @exercise_muscle = @exercise.exercise_muscles.new(muscle_id: muscle_id)
          if !@exercise_muscle.save
            render json: @exercise_muscle.errors, status: :unprocessable_entity and return
          end
        end
        render json: {exercise: @exercise, muscles: @exercise.exercise_muscles.map{ |exercise_muscles| exercise_muscles.muscle }}, status: :created and return
      else
        render json: @exercise.errors, status: :unprocessable_entity and return
      end
    end

    # PATCH/PUT /exercises/1
    def update
      if @exercise.update(exercise_params)
        @exercise.exercise_muscles.destroy_all
        params[:exercise][:muscles].each do |muscle_id|
          @exercise_muscle = @exercise.exercise_muscles.create(muscle_id: muscle_id)
        render json @exercise_muscle.errors, status: :unprocessable_entity and return unless @exercise_muscle.save
        end
        render json: {exercise: @exercise, muscles: @exercise.exercise_muscles.map{ |exercise_muscles| exercise_muscles.muscle }}, status: :ok and return
      else
        render json: @exercise.errors, status: :unprocessable_entity
      end
    end

    # DELETE /exercises/1
    def destroy
      @exercise.destroy
      render json: {}, status: :ok
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:name, :muscles)
    end
  end
end
