class GuestsController < ApplicationController
    def show
      @guest = Guest.find(params[:id])
    end
  
    def create
      guest = Guest.new(guest_params)
      if guest.save
        redirect_to "/guest/#{guest.id}"
      else
        redirect_to "/guest/#{guest.id}"
        flash[:alert] = "Error: #{error_message(guest.errors)}"
      end
    end
  
    private
  
    def guest_params
      params.permit(:id, :name, :nights)
    end
  end
end