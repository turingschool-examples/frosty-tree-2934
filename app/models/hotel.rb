class Hotel < ApplicationRecord
  has_many :rooms


# this is as far as I got. Couldn't figure out how to call all the guests linked to the hotels

  def guests_at_hotel
    Guest.find_each do |guest|
      guest.rooms.hotel_id = self.id
    end
  end
end
