class Hotel < ApplicationRecord
  has_many :rooms
  has_many :reservations, through: :rooms
end
