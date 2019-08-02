module Api
  class MusclesController < ApplicationController
    before_action :set_muscle, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:update, :create, :destroy]

    # GET /muscles
    def index
      @muscles = Muscle.all
      render json: @muscles, status: :ok
    end

    # POST /muscles
    def create
      @muscle = Muscle.new(muscle_params)
      if @muscle.save
         render json: {}, status: :created, location: @muscle
      else
        render json: @muscle.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /muscles/1
    def update
      if @muscle.update(muscle_params)
        render json: {}, status: :ok, location: @muscle
      else
        render json: @muscle.errors, status: :unprocessable_entity
      end
    end

    # DELETE /muscles/1
    def destroy
      @muscle.destroy
      render json: {}, status: :ok
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle
      @muscle = Muscle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def muscle_params
      params.require(:muscle).permit(:name)
    end
  end
end
