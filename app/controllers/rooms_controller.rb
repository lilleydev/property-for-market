class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
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
    @room = Room.find(params[:id])
  end
end
