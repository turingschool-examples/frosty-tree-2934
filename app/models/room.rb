class Room < ApplicationRecord
  has_many :guests, through :stays
  belongs_to :hotel

  validates :rate, presence: true, numericality: true
  validates :suite, presence: true
end