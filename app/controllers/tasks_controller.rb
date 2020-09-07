class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:params).permit(:name, :description, :completed)
  end
end
