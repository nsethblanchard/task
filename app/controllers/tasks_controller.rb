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
    if logged_in?
      erb :"/tasks/new.html"
    end
  end

  # POST: /tasks
  post "/tasks" do
    if params[:task_name] != nil && params[:task_type] != nil && params[:task_content] != nil && params[:date_due] != nil
      @task = Task.create(task_name: params[:task_name], task_type: params[:task_type], task_content: params[:task_content], date_due: params[:date_due], user_id: session[:user_id])
      
      redirect "/tasks"
    else 
      redirect "/tasks/new"
    end
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
