class Hotel < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :rooms
end