class Room < ApplicationRecord
  validates :rate, presence: true
  validates :suite, presence: true

  belongs_to :hotel
end