class CommentsController < ApplicationController
  def index
    @comments = @realtor.comments
  end

  def new
    @comment = @realtor.comments.build
  end

  private

  def set_comment
    @comment = @realtor.comments.find(params[:id])
  end

  def get_realtor
    @realtor = realtor.find(params[:realtor_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :description)
  end
end
