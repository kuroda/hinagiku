class TasksController < ApplicationController
  def index
    @tasks = Task.where(:done => false)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task])
    redirect_to @task
  end
end
