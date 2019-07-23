class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    render html: 'the missile knows where it isn\'t'
  end
  def authorize_request
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
end
