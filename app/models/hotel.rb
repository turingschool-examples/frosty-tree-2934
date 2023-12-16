class Hotel < ApplicationRecord
  has_many :rooms

  validates :name, presence: true
  validates :location, presence: true

  def guest_list 
    rooms.joins({guest_rooms: :guest}).select("guests.name").distinct
  end


end