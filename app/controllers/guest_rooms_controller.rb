class GuestRoomsController < ApplicationController
  
def create
  @guest_room = GuestRoom.create!(guest_room_params)
  @guest = Guest.find(params[:guest_id]) # I think there's a way to pass this param in differently to avoid having to type in the Guest ID on the form
  redirect_to "/guests/#{@guest.id}"
end

private
  def guest_room_params
    params.permit(:guest_id, :room_id)
  end

end