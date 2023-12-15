class Hotel < ApplicationRecord
  has_many :rooms
  has_many :reservations, through: :rooms

  def find_all_uniq_guests

  end
end
