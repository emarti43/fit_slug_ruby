class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    response = RestClient.get 'https://api.nal.usda.gov/ndb/V2/reports', {params: {ndbno:'01009', type: 'b', format: 'json', api_key: ENV["NDB_API_KEY"]}}
    render html: response
  end
end
