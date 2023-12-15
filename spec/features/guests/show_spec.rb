require "rails_helper"

RSpec.describe "Guest show page", type: :feature do
  it "shows guest name and a list of rooms they've stayed in, and the room's attributes, including hotel it belongs to" do
    hotel1 = Hotel.create!(name: "Hotel 6", location: "San Francisco")
    room23 = hotel1.rooms.create!(rate: 45, suite: "Love-Bugs")
    guest1 = room23.guests.create!(name: "Fred")

    visit "/guests/#{guest1.id}"

    expect(current_path).to eq("/guests/#{guest1.id}")
    expect(page).to have_content(guest1.name)
    expect(page).to have_content(room23.suite)
    expect(page).to have_content(hotel1.name)
  end
end
