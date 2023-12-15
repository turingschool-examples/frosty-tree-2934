class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def create
    guest_room = GuestRoom.create(room_id:params[:room_id], guest_id: params[:id])

    redirect_to "/guests/#{params[:id]}"
  end
end