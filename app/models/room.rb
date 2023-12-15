class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guests, through: :guest_rooms

  def total_guests
    self.guests.count # Is this an AR method or is this ruby??
  end

end