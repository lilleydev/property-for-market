class NeedsHelpController < ApplicationController
  before_action :set_tasks
  def index
    if params[:name]
      @search = @tasks.where('name LIKE ?', "%#{params[:name]}%")
    else

      @usertask = UserTask.find_by(id: params[:id])
    end
  end

  private

  def set_tasks
    @tasks = Task.needs_help
  end
end
