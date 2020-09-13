module RoomsHelper
  def room_count(user)
    user.rooms.count
  end
end
