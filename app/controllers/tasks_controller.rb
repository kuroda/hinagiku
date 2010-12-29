class TasksController < ApplicationController
  def index
    @tasks = Task.where(:done => false)
  end
end
