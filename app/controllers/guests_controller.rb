class GuestsController < ApplicationController
  
  def show
    @guest = Guest.find(params[:id])
  end

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def add_room
    @guest = Guest.find(params[:id])
    @guest.add_room_by_id(params[:room_id])

    redirect_to "/guests/#{@guest.id}"
  end
end