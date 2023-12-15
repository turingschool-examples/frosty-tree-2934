class GuestsController < ApplicationController

  def show
    @guests = Guest.all
  end

end