class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    render html: 'the missile knows where it isn\'t'
  end
end
