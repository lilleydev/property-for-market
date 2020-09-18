class UserTasksController < ApplicationController
  def new
    task = Task.find_by(params[:task_id])
    task.user_tasks
    render '/needs_help/new.html'
  end

  def create
    binding.pry
    if params[:finish_by]
      UserTask.find_by(id:)
    else
      task = Task.find_by(id: params[:task_id])
      task.user_tasks.build(user: current_user)
      redirect_to user_path(current_user) if task.save
    end
  end

  def destroy
    task = Task.find_by(id: params[:task_id])
    task.helpers.delete(current_user)

    redirect_to user_path(current_user) if task.save
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def user_task_params
    params.require(:user_task).permit(:finish_by)
  end
end
