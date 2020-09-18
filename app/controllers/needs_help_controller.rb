class NeedsHelpController < ApplicationController
  def index
    @tasks = Task.needs_help
    @usertask = UserTask.find_by(id: params[:id])
  end
end
