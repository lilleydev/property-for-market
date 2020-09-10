class UserTasksController < ApplicationController
  def create
    task = Task.find_by(params[:task_id])
    task.user_tasks.build(user: current_user)
    redirect_to tasks_path if task.save
  end
end
