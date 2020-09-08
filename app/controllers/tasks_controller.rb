class TasksController < ApplicationController
  before_action :get_room
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = @room.tasks
  end

  def new
    @task = @room.tasks.build
  end

  def create
    @task = @room.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to room_path(@room), notice: 'Task was successfully created.' }
        format.json { render room_path(@room), status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
   end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to room_task_path(@room), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to room_path(@room), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = @room.tasks.find(params[:id])
  end

  def get_room
    @room = Room.find(params[:room_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
