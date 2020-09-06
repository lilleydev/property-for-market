class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    binding.pry
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render new_room_path
    end
  end

  def index
    @rooms = Room.all
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :features)
  end
end
