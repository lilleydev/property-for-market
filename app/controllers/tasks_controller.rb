class TasksController < ApplicationController
  before_action :get_room
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = if @room
               @room.tasks
             else
               current_user.tasks
             end
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
        redirect_to room_tasks_path(@room), notice: 'Task was successfully updated.'
      else
        render :edit
      end

    else
      @task.update(needs_help: !@task.needs_help)
      redirect_to tasks_path, notice: 'Good job asking for help!'

  end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def get_room
    @room = Room.find_by(id: params[:room_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
