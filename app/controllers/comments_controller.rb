class CommentsController < ApplicationController
  def index
    @comments = @realtor.comments
  end

  def new
    @comment = @realtor.comments.build
  end
end
