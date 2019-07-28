module Api
  class MealRecordsController < ApplicationController
    before_action :set_meal_record, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:index, :create, :destroy]

    # GET /meal_records
    # GET /meal_records.json
    def index
      @meal_records = MealRecord.all.where("user_id = #{@user.id}")
      render json: @meal_records.map{|meal_record| { user_id: meal_record.user_id, num_servings: meal_record.num_servings, meal: Meal.find(meal_record.meal_id)} }.to_json(), status: :ok
    end

    # GET /meal_records/1
    # GET /meal_records/1.json
    def show
    end

    # GET /meal_records/new
    def new
      @meal_record = MealRecord.new
    end

    # GET /meal_records/1/edit
    def edit
    end

    # POST /meal_records
    def create
      @meal_record = MealRecord.new(meal_record_params)
      if @meal_record.save
        render json: {messsage: 'created successfully'}, status: :created
      else
        render json: @meal_record.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /meal_records/1
    # PATCH/PUT /meal_records/1.json
    def update
      respond_to do |format|
        if @meal_record.update(meal_record_params)
          format.html { redirect_to @meal_record, notice: 'Meal record was successfully updated.' }
          format.json { render :show, status: :ok, location: @meal_record }
        else
          format.html { render :edit }
          format.json { render json: @meal_record.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /meal_records/meal_record.id
    def destroy
      if @user.id != @meal_record.user_id
        puts "#{@user.id}, #{@meal_record.user_id}"
        render json: {message: 'invalid credentials'}, status: :unauthorized and return
      end
      @meal_record.destroy
      render json: {}, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_meal_record
        @meal_record = MealRecord.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def meal_record_params
        params.require(:meal_record).permit(:user_id, :meal_id, :num_servings)
      end
  end
end
