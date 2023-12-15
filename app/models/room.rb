class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guests

  def add_guest_to_room(guest_id)
    guest = Guest.find(guest_id)
    self.guests << guest
  end
end