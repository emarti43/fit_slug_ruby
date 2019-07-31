module Api
  class SessionsController < ApplicationController
    include ApplicationHelper
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
      authorize false
      if !!@user
        render json: {username: @user.name}, status: :ok
      else
        render json: {status: 'error'}, status: :bad_request
      end
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
