require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password123 is the most secure"
  end

  get "/" do
    erb :welcome
  end

  get '/logout' do
    session.clear 
    redirect "/"
  end
end
