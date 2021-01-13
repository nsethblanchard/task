require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password123 is the most secure"
  end

  get '/' do
    erb :welcome
  end

  get '/login' do
    erb :"login.html"
  end

  post '/login' do
    @user = User.find_by(email: params[:email]) #use find_by because it returns nil if can't find instead of .find which has an AR error
    if @user && @user.authenticate(params[:password]) #checks to see if pw matches the salted pw saved in password_digest -ensures validated user
      session[:user_id] = @user.id
      redirect "/tasks"
    else
      redirect '/signup'  
    end
  end

  get '/logout' do
    session.clear 
    redirect "/"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
