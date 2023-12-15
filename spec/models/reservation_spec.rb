require "rails_helper"

RSpec.describe Reservation, type: :model do
  it {should have_many :rooms }
  it {should have_many :guests }
end
