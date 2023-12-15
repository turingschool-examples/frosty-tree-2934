class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guests, through: :guest_rooms

  def add_guest_to_room(guest_id)
    guest = Guest.find(guest_id)
    self.guests << guest
  end

  def count_guests
    self.guests.count
  end
end