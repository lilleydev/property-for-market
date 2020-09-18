class UserTasksController < ApplicationController
  def new
    task = Task.find_by(params[:task_id])
    task.user_tasks
    redirect_to '/needs_help'
  end

  def create
    task = Task.find_by(id: params[:task_id])
    task.user_tasks.build(user: current_user)
    redirect_to user_path(current_user) if task.save
  end

  def destroy
    task = Task.find_by(id: params[:task_id])
    task.helpers.delete(current_user)

    redirect_to user_path(current_user) if task.save
  end

  def update
    usertask = UserTask.find_by(id: params[:id])
    if usertask.update(user_task_params)
      redirect_to room_tasks_path(usertask.task.room)
    else
      redirect_to room_tasks_path(usertask.task.room)
    end
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def user_task_params
    params.require(:user_task).permit(:instructions)
  end
end
