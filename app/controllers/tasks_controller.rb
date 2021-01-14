class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    not_logged_in?
      @tasks = current_user.tasks
      erb :"/tasks/index.html"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    not_logged_in?
      erb :"/tasks/new.html"
  end

  # POST: /tasks
  post "/tasks" do
    not_logged_in?
    if params[:task_name] != nil && params[:task_type] != nil && params[:task_content] != nil 
      @task = current_user.tasks.build(task_name: params[:task_name], task_type: params[:task_type], task_content: params[:task_content], date_due: params[:date_due])
      @task.save
      # @task = Task.create(task_name: params[:task_name], task_type: params[:task_type], task_content: params[:task_content], date_due: params[:date_due], user_id: current_user.id)
      
      redirect "/tasks"
    else 
      redirect "/tasks/new"
    end
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    not_logged_in?
    @task = Task.find(params[:id])
    erb :"/tasks/show.html"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
      not_logged_in?
      if @task = current_user.tasks.find_by_id(params[:id])
        erb :"/tasks/edit.html"
      else
        redirect "/tasks"
      end
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    not_logged_in?
    @task = current_user.tasks.find_by_id(params[:id])
      if !@task
        redirect "/tasks/:id"
      end
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    not_logged_in?
    @task = current_user.tasks.find_by_id(params[:id]).delete
    redirect "/tasks"
  end
end
