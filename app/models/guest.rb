class Guest < ApplicationRecord
  validates :name, presence: true
  validates :nights, presence: true

  belongs_to :room
  has_many :rooms
end