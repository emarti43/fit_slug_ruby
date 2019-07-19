module Api
  class SessionsController < ApplicationController
    protect_from_forgery with: :exception
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    def new_user
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          redirect_to controller: :sessions, action: :create
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      @user = User.find_by(email: params[:email].downcase, name: params[:username])
      if @user && @user.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        exp_time = Time.now + 24.hours.to_i
        render json: {token: token, exp: exp_time.strftime('%m-%d-%Y %H:%M'), username: @user.name}, status: :ok
      else
        render json: [], status: :bad_request, text: "invalid credentials"
      end
    end

    def validate
      header  = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        @user =  User.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end

    private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end
  end
end
