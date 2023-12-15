class GuestsController < ApplicationController
    def index
        @guests = Guest.all
    end

    def show
        @guest = Guest.find(params[:id])

        if params[:added_room_id].present?
            room_id = params[:added_room_id]
            room = Room.find(room_id)
            room.add_guest_to_room(@guest.id)
        end
    end
  end