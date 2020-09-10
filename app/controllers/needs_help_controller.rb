class NeedsHelpController < ApplicationController
  def index
    @tasks = Task.needs_help
  end
end
