class Guest < ApplicationRecord
  validates :name, presence: true
  validates :nights, presence: true

  has_many :room_guests
  has_many :rooms, through: :room_guests
end