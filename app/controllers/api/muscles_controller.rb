module Api
  class MusclesController < ApplicationController
    before_action :set_muscle, only: [:show, :edit, :update, :destroy]

    # GET /muscles
    # GET /muscles.json
    def index
      @muscles = Muscle.all
      render json: @muscles, status: :ok
    end

    # GET /muscles/1
    # GET /muscles/1.json
    def show
    end

    # GET /muscles/new
    def new
      @muscle = Muscle.new
      render json: @muscle, status: :ok
    end

    # GET /muscles/1/edit
    def edit
    end

    # POST /muscles
    # POST /muscles.json
    def create
      @muscle = Muscle.new(muscle_params)

      respond_to do |format|
        if @muscle.save
          format.json { render :show, status: :created, location: @muscle }
        else
          format.json { render json: @muscle.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /muscles/1
    # PATCH/PUT /muscles/1.json
    def update
      respond_to do |format|
        if @muscle.update(muscle_params)
          format.json { render :show, status: :ok, location: @muscle }
        else
          format.json { render json: @muscle.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /muscles/1
    # DELETE /muscles/1.json
    def destroy
      @muscle.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
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
