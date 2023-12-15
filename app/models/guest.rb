class Guest < ApplicationRecord
  has_many :reservations
  has_many :rooms, through: :reservations

  def add_room(room)
    rooms << room
  end
end
