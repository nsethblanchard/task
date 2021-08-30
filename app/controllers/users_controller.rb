class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/users" do
    @user = User.find_by(email: params[:email])
    if @user
      redirect to "/login"
    elsif params[:name] != nil && params[:email] != nil && params[:password] != nil
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
        session[:user_id] = @user.id #this line is the line that logs the user in
        redirect "/tasks"
    else
      redirect "/signup"
    end
  end

end
