require 'rails_helper'

RSpec.describe 'guest show', type: :feature do
  hotel = Hotel.create!(name: "Generic hotel", location: "mn")
  room = Room.create!(rate: 1, suite: "pres", hotel: hotel)
  guest = Guest.create!(name: "Larry", nights: 1, room: room)
  # Story 1
  it "shows the guest and the rooms they've stayed in plus its details" do 
    # When I visit a guest's show page
    visit "/guests/#{guest.id}"
    # I see the guest's name
    expect(page).to have_content(guest.name)
    # And I see a list of all the rooms they've stayed in
    expect(page).to have_content("Rooms: pres")
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to.
    expect(page).to have_content("Room: #{room.suite}")
    expect(page).to have_content("Nightly Rate: #{room.rate}")
    expect(page).to have_content("Hotel: #{hotel.name}") 
  end
end