class GuestRoomsController < ApplicationController 
  def create 
    room = Room.find(params[:room_id])
    guest = Guest.find(params[:id])
    guest_room = GuestRoom.new(guest_id: guest.id, room_id: room.id)
    if guest_room.save 
      flash[:notice] = "The room has been added to the guest"
    else 
      flash[:alert] = "There was a problem and the room was not added to the guest"
    end
    redirect_to "/guests/#{guest.id}"
  end
end