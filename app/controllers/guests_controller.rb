class GuestsController < ApplicationController

  def show
    @guest = Guest.includes(rooms: :hotel).find(params[:id])
  end
  
end
