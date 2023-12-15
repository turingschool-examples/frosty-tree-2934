class Guest < ApplicationRecord
  has_many :reservations
  has_many :rooms, through: :reservations

  def find_hotel
    Guest
  end
end
