class Room < ApplicationRecord
  belongs_to :hotel
  has_many :reservations
  has_many :guests, through: :reservations

  def find_hotel
    Room.joins(:hotel).where("hotel_id = ?", self.id).pluck(:name).first
  end

  def number_of_guests
    guests.count
  end
end
