class CommentsController < ApplicationController
  def index
    @comments = @realtor.comments
  end

  def new
    @comment = @realtor.comments.build
  end

  def create
    @comment = @realtor.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to realtor_path(@realtor), notice: 'Comment was successfully created.' }
        format.json { render realtor_path(@realtor), status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
   end
    end
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
