class  GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  # def new
  #   @? = ?.find(params[:shelter_id])
  # end

  # def create
  #    = .new(_params)
  # end

  # def edit
  #   @? = .find(params[:id])
  # end

  def update
    @guest = Guest.find(params[:id])
    @room = Room.find(params[:room_id])
    @guest.rooms << @room
    redirect_to "/guests/#{guest.id}"
  end

  # def destroy
  #   .find(params[:id]).destroy
  #   redirect_to "/"
  # end

  # private

  # def _params
  #   params.permit(:name)
  # end

end