module Api
  class SessionsController < ApplicationController
    protect_from_forgery with: :null_session
    def new
    end
    def create
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        render json: {token: JsonWebToken.encode(user_id: user.id)}, status: :ok
      else
        render json: [], status: :bad_request, text: "invalid credentials"
      end
    end

    def validate
      if request.headers['Authorization'].present?
        decoded_token = JsonWebToken.decode(request.headers['Authorization'])
        user = User.find(decoded_token[:user_id])
        if user
          render json: [], status: :ok
        else
          render json: [], status: bad_request, text: "invalid authentication token"
        end
      else
        render json: [], status: :bad_request, text: "No authenication token found"
      end
    end
    def destroy
    end
  end
end
