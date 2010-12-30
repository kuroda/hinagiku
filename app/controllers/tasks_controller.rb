class TasksController < ApplicationController
  def index
    @tasks = Task.undone
  end

  def done
    @tasks = Task.done
    render :action => "index"
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(params[:task])
    redirect_to @task
  end

  def update
    @task = Task.find(params[:id])
    @task.attributes = params[:task]
    @task.save
    redirect_to @task
  end

  def finish
    @task = Task.find(params[:id])
    @task.update_attribute(:done, true)
    redirect_to :back
  end

  def unfinish
    @task = Task.find(params[:id])
    @task.update_attribute(:done, false)
    redirect_to :back
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :tasks
  end
end
