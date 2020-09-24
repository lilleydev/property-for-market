class RoomsController < ApplicationController
  before_action :set_room, :user_room, only: %i[show edit update destroy]
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
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
      end
    end
  end

  def index
    @rooms = current_user.rooms
  end

  def show; end

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

  def user_room
    redirect_to root_path, notice: 'Sorry, you can not view other user rooms.' if current_user != @room.user
  end
end
