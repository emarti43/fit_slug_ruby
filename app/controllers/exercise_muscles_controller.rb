class ExerciseMusclesController < ApplicationController
  before_action :set_exercise_muscle, only: [:show, :edit, :update, :destroy]

  # GET /exercise_muscles
  # GET /exercise_muscles.json
  def index
    @exercise_muscles = ExerciseMuscle.all
  end

  # GET /exercise_muscles/1
  # GET /exercise_muscles/1.json
  def show
  end

  # GET /exercise_muscles/new
  def new
    @exercise_muscle = ExerciseMuscle.new
  end

  # GET /exercise_muscles/1/edit
  def edit
  end

  # POST /exercise_muscles
  # POST /exercise_muscles.json
  def create
    @exercise_muscle = ExerciseMuscle.new(exercise_muscle_params)

    respond_to do |format|
      if @exercise_muscle.save
        format.html { redirect_to @exercise_muscle, notice: 'Exercise muscle was successfully created.' }
        format.json { render :show, status: :created, location: @exercise_muscle }
      else
        format.html { render :new }
        format.json { render json: @exercise_muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_muscles/1
  # PATCH/PUT /exercise_muscles/1.json
  def update
    respond_to do |format|
      if @exercise_muscle.update(exercise_muscle_params)
        format.html { redirect_to @exercise_muscle, notice: 'Exercise muscle was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise_muscle }
      else
        format.html { render :edit }
        format.json { render json: @exercise_muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_muscles/1
  # DELETE /exercise_muscles/1.json
  def destroy
    @exercise_muscle.destroy
    respond_to do |format|
      format.html { redirect_to exercise_muscles_url, notice: 'Exercise muscle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_muscle
      @exercise_muscle = ExerciseMuscle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_muscle_params
      params.require(:exercise_muscle).permit(:e_id, :m_id)
    end
end
