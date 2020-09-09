class CommentsController < ApplicationController
  def index
    @comments = @room.comments
  end

  def new
    @comment = @room.comments.build
  end

  def create
    @comment = @room.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to room_path(@room), notice: 'Comment was successfully created.' }
        format.json { render room_path(@room), status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
   end
    end
  end

  private

  def set_comment
    @comment = @room.comments.find(params[:id])
  end

  def get_room
    @room = room.find(params[:room_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :description)
  end
end
