class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    render html: 'the missile knows where it isn\'t'
  end

  def authorize request
    header  = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header)
      return nil if decoded.nil?
      user =  User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      return nil
    rescue JWT::DecodeError => e
      return nil
    end
    return user
  end
end
