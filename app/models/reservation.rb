class Reservation < ApplicationRecord
  has_many :rooms
  has_many :guests
end
