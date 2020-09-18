class TasksController < ApplicationController
  before_action :get_room, except: %i[update destroy]
  before_action :set_task, only: %i[edit update destroy show]

  def index
    @tasks = @room.tasks
    @usertasks = @tasks.map { |task| task.user_tasks }.flatten
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
    if params[:task]
      if @task.update(task_params)
        @room = Room.find_by(id: @task[:room_id]) if params[:task]
        redirect_to room_path(@room), notice: 'Task was successfully updated.'
      else
        render :edit
        end

    else
      get_room
      @task.update(needs_help: !@task.needs_help)
      redirect_to root_path, notice: 'Good job asking for help!'

  end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to room_path(@task.room), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show; end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def get_room
    @room = Room.find_by(id: params[:room_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
