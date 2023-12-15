class Guest < ApplicationRecord
  validates :name, presence: true
  validates :nights, presence: true


  has_many :rooms
end