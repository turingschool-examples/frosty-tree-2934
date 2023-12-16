class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guests, through: :guest_rooms

  validates :suite, presence: true
  validates :rate, presence: true

  def guest_count
    # why doesn't AR/SQL not like .first.guest_count?? have to use [0] to make it work? does .first wrap the object in something (like AR) but doesn't do that with [0]?? 
    guest_rooms.select("COUNT(guest_rooms.guest_id) AS guest_count, guest_rooms.room_id").group("guest_rooms.room_id")[0].guest_count
  end
end