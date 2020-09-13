class UserTasksController < ApplicationController
  def new
    @task = Task.find_by(params[:task_id])
    render '/needs_help/new.html'
  end

  def create
    # binding.pry
    task = Task.find_by(id: params[:task_id])
    task.user_tasks.build(user: current_user)
    redirect_to tasks_path if task.save
  end

  def destroy
    task = Task.find_by(id: params[:task_id])
    task.helpers.delete(current_user)

    redirect_to tasks_path if task.save
  end
end
