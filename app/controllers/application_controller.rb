class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    render html: 'the missile knows where it isn\'t'
  end

  def authorize redirect=true
    header  = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header)
      @user =  User.find(decoded[:user_id])
    rescue StandardError => e
      @user = nil
    end
    redirect_to '/validate', status: :unauthorized and return if @user.nil? && redirect
  end
end
