module Api
  class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update, :destroy]

    # GET /meals.json
    def index
      @meals = Meal.all
      render json: @meals, status: :ok
    end

    # GET /meals/1
    # GET /meals/1.json
    def show
    end

    # GET /meals/new
    def new
      @meal = Meal.new
      render  json: @meal, status: :ok
    end

    # GET /meals/1/edit
    def edit
    end

    # POST /meals.json
    def create
      @meal = Meal.new(meal_params)

      respond_to do |format|
        if @meal.save
          format.json { render :show, status: :created, location: @meal }
        else
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /meals/1.json
    def update
      respond_to do |format|
        if @meal.update(meal_params)
          format.json { render :show, status: :ok, location: @meal }
        else
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /meals/1
    # DELETE /meals/1.json
    def destroy
      @meal.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:name, :serving_size, :kcal, :total_fat, :sat_fat, :polyun_fat, :monoun_fat, :cholesterol, :sodium, :potassium, :total_carb, :fiber, :sugar, :protein, :vitamin_a, :calcium, :vitamin_d, :vitamin_c, :iron, :magnesium, :cobalamin, :vitamin_b6)
    end
  end
end
