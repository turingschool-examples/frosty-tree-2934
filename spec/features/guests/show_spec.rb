require 'rails_helper'

RSpec.describe 'guest show', type: :feature do
  hotel = Hotel.create!(name: "Generic hotel", location: "mn")
  room = Room.create!(rate: 1, suite: "pres", hotel: hotel)
  guest = Guest.create!(name: "Larry", nights: 1)

  RoomGuest.create!(room: room, guest: guest)
  hotel.rooms << room
  # Story 1
  it "shows the guest and the rooms they've stayed in plus its details" do 
    # When I visit a guest's show page
    visit "/guests/#{guest.id}"
    # I see the guest's name
    expect(page).to have_content(guest.name)
    # And I see a list of all the rooms they've stayed in
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to.
    expect(page).to have_content("Room: #{room.suite}")
    expect(page).to have_content("Nightly Rate: #{room.rate}")
    expect(page).to have_content("Hotel: #{hotel.name}") 
  end

  # Story 2
  it "can add a guest to a room" do 
    # When I visit a guest's show page
    visit "/guests/#{guest.id}"
    # Then I see a form to add a room to this guest.

    
When I fill in a field with the id of an existing room
And I click submit
Then I am redirected back to the guest's show page
And I see the room now listed under this guest's rooms.
(You do not have to test for a sad path, for example if the ID submitted is not an existing room)
  end
end