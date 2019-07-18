module Api
  class SessionsController < ApplicationController
    protect_from_forgery with: :exception
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    def new_user
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          session[:user_id] = {value: user.id, expires: 1.minutes.from_now}
          render json: {}, status: :ok
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        session[:user_id] = {value: user.id, expires: 1.minutes.from_now}
        render json: {'valid password': true}, status: :ok
      else
        render json: [], status: :bad_request, text: "invalid credentials"
      end
    end

    def validate
      if !!session[:user_id]
        render json: {'valid': true}, status: :ok
      else
        render json: {'valid': false}, status: :bad_request, text: "invalid cookie"
      end
    end

    private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end
  end
end
