class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  private

  def guest_params
    params.permit(:name, :nights)
  end
end
