class Room < ApplicationRecord
  has_many :guests
  belongs_to :hotel

  validates :rate, presence: true, numericality: true
  validates :suite, presence: true
end