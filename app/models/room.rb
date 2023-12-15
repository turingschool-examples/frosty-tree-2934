class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :reservation
  has_many :guests
end
