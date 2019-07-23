module Api
  class SessionsController < ApplicationController
    protect_from_forgery with: :exception
    protect_from_forgery with: :null_session
    def signup
      @user = User.new(signup_params)
      if @user
        token = JsonWebToken.encode(user_id: @user.id)
        exp_time = Time.now + 24.hours.to_i
        render json: {token: token, exp: exp_time.strftime('%m-%d-%Y %H:%M'), username: @user.name}, status: :ok
      else
        render json: [], status: :bad_request, text: "Signup went wrong, please try again."
      end
    end

    def create
      login_params()
      @user = User.find_by(name: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
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
      render json: { id: @user.id, username: @user.name}, status: :ok
    end

    private
    def login_params
      params.require(:user).permit(:username, :password)
    end

    def signup_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end
end
