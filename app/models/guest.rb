class Guest < ApplicationRecord
    validates :name, presence: true
    validates :nights, presence: true, numericality: true

    has_many :rooms
end