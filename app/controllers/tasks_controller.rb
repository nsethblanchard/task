class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    if logged_in?
      @tasks = Task.where(user_id: session[:user_id])
      erb :"/tasks/index.html"
    else
      redirect "/login"
    end
  end

  # GET: /tasks/new
  get "/tasks/new" do
    erb :"/tasks/new.html"
  end

  # POST: /tasks
  post "/tasks" do
    redirect "/tasks"
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    erb :"/tasks/show.html"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    erb :"/tasks/edit.html"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    redirect "/tasks/:id"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    redirect "/tasks"
  end
end
