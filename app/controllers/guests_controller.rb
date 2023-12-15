class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def update
    guest = Guest.find(params[:id])
    guest.add_room(Room.find(params[:room_id]))

    redirect_to show_guest_path
  end
end
