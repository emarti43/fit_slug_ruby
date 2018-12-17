class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://api.nal.usda.gov/ndb/V2/reports?ndbno=01009&type=b&format=json&api_key=DEMO_KEY',
    )
    render html: response
  end
end
