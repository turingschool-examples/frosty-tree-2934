class Guest < ApplicationRecord
  has_many :stays
  has_many :rooms, through: :stays

  def add_room_by_id(room_id)
    room = Room.find_by(id: room_id)
    if room
      self.rooms << room
    end
  end
end