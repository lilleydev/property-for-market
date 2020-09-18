class NeedsHelpController < ApplicationController
  def index
    @tasks = Task.needs_help
    #  UserTask.find_by(task_id: t.id)
  end
end
