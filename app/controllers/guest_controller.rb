class GuestController < ApplicationRecord 
  def show 
    guest=Guest.find(params[:id])
  end
end