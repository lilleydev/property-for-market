class NeedsHelpController < ApplicationController
  def index
    if params[:name]
      @tasks = Task.needs_help
      @search = @tasks.where('name LIKE ?', "%#{params[:name]}%")
    else
      @tasks = Task.needs_help

      @usertask = UserTask.find_by(id: params[:id])
    end
  end
end
