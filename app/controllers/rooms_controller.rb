class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to root_path
    else
      render new_room_path
    end
  end

  def index
    @rooms = Room.all
  end

  def show
    # binding.pry
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :features)
  end

  def set_room
    @room = Room.find_by(params[:id])
  end
end
