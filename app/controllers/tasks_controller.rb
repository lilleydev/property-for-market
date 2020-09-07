class TasksController < ApplicationController
  before_action :get_room
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

  def get_room
    @room = Room.find(params[:room_id])
  end

  def task_params
    params.require(:params).permit(:name, :description, :completed)
  end
end
