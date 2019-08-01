module Api
  class ExercisesController < ApplicationController
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:create, :update, :destroy]

    # GET /exercises
    def index
      @exercises = Exercise.all
      render json: @exercises, status: :ok
    end

    # GET /exercises/1
    def show
    end

    # GET /exercises/new
    def new
      @exercise = Exercise.new
      render json: @exercise, status: :ok
    end

    # GET /exercises/1/edit
    def edit
    end

    # POST /exercises
    # POST /exercises.json
    def create
      @exercise = Exercise.new(exercise_params)
      if @exercise.save
        params[:exercise][:muscles].each do |muscle_id|
          @exercise_muscle = @exercise.exercise_muscles.new(m_id: muscle_id)
          if !@exercise_muscle.save
            render json: @exercise_muscle.errors, status: :unprocessable_entity and return
          end
        end
        render json: {message: "created exercise"}, status: :created and return
      else
        render json: @exercise.errors, status: :unprocessable_entity and return
      end
    end

    # PATCH/PUT /exercises/1
    def update
      respond_to do |format|
        if @exercise.update(exercise_params)
          format.json { render :show, status: :ok, location: @exercise }
        else
          format.json { render json: @exercise.errors, status: :unprocessable_entity }
        end
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
