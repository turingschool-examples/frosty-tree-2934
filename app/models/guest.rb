class Guest < ApplicationRecord
  belongs_to :rooms
  has_many :rooms
end