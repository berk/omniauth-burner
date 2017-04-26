require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-burner'

SCOPE = 'email'

class App < Sinatra::Base

  get '/' do
    redirect '/auth/burner'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
  
  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :burner, ENV['APP_ID'], ENV['APP_SECRET'], :scope => SCOPE
end

run App.new
