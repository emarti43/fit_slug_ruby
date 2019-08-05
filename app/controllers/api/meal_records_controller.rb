module Api
  class MealRecordsController < ApplicationController
    before_action :set_meal_record, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:index, :create, :destroy, :update]

    # GET /meal_records
    # GET /meal_records.json
    def index
      # @meal_records = @user.meal_records
      meal_records = @user.meal_records
      mapping = meal_records.map do |meal_record|
        {
          id: meal_record.id,
          user_id: meal_record.user_id,
          num_servings: meal_record.num_servings,
          meal: meal_record.meal
        }
      end
      render json: mapping, status: :ok
    end

    # POST /meal_records
    def create
      @meal_record = @user.meal_records.new(meal_record_params)
      if @meal_record.save
        render json: { messsage: 'created successfully' }, status: :created
      else
        render json: @meal_record.errors, status: :unprocessable_entity
      end
    end

    # PUT /meal_records/1
    def update
      if @user.id != @meal_record.user_id
        render json: { message: 'invalid credentials' }, status: :unauthorized and return
      end
      if @meal_record.update(meal_record_params)
        render json: { message: 'record updated'}, status: :ok
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    # DELETE /meal_records/meal_record.id
    def destroy
      if @user.id != @meal_record.user_id
        render json: { message: 'invalid credentials' }, status: :unauthorized and return
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
        params.require(:meal_record).permit(:meal_id, :num_servings)
      end
  end
end
