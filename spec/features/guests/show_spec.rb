require "rails_helper"

RSpec.describe "Guest show page", type: :feature do
  it "shows guest name and a list of rooms they've stayed in, and the room's attributes, including hotel it belongs to" do
    hotel1 = Hotel.create!(name: "Hotel 6", location: "San Francisco")
    guest1 = Guest.create!(name: "Fred")
    room23 = Room.create!(rate: 45, suite: "Love-Bugs")


  end
end
