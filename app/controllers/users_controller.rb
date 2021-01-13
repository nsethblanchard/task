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
        # flash[:message] = "User already exists. Please login to see your tasks."
        redirect to "/login"
      else
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
          if @user.save
            session[:user_id] = @user.id #this line is the line that logs the user in
            redirect "/tasks"
          end
      end
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find()
    
    erb :'/users/show'
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
