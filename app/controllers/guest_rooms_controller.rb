class GuestRoomsController < ApplicationController
  
def create
  @guest_room = GuestRoom.create!(guest_room_params)
  @guest = Guest.find(params[:guest_id])
  redirect_to "/guests/#{@guest.id}"
end

private
  def guest_room_params
    params.permit(:guest_id, :room_id)
  end

end