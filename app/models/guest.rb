class Guest < ApplicationRecord
  belongs_to :hotel
  has_many :room_guests
  has_many :rooms,through: :room_guests
end