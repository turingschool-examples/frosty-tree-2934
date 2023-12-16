class HotelsController < ApplicationController
  def show 
    @hotels = Hotel.all
    @hotel = Hotel.find(params[:id])
  end
end