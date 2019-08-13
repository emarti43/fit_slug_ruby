module Api
  class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:create, :update, :destroy]

    # GET /meals
    def index
      @meals = Meal.all
      render json: @meals, status: :ok
    end

    # GET /meals/fields
    def fields
      render json: Meal.column_names - ["id", "created_at", "updated_at"], status: :ok
    end

    # POST /meals
    def create
      @meal = Meal.new(meal_params)
      if @meal.save
        render json: {message: "created meal"}, status: :created and return
      else
        render json: @meal.errors, status: :unprocessable_entity and return
      end
    end

    # PATCH/PUT /meals/1
    def update
      if @meal.update(meal_params)
        render json: {}, status: :ok and return
      else
        render json: @meal.errors, status: :unprocessable_entity
      end
    end

    # DELETE /meals/1
    def destroy
      @meal.destroy
      render json: {}, status: :ok
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
