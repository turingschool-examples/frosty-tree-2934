class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :guest
end