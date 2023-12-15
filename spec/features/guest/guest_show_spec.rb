require "rails_helper"

RSpec.describe "the guest show page", type: :feature do

  it "shows a list of all the rooms a guest has stayed in" do
    hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    room_2 = hotel_1.rooms.create!(rate: 5, suite: "Squatter")
    guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)

    # When I visit a guest's show page
    visit "/guests/#{guest.id}"
    
    # I see the guest's name
    expect(page).to have_content(guest_1.name)
    # And I see a list of all the rooms they've stayed in
    expect(page).to have_content(room_1.id)
    expect(page).to have_content(room_2.id)
    # including the room's suite, nightly rate, 
    expect(page).to have_content(room_1.suite)
    expect(page).to have_content(room_2.suite)
    expect(page).to have_content(room_1.rate)
    expect(page).to have_content(room_2.rate)
    # and the name of the hotel that it belongs to.
    expect(page).to have_content(hotel_1.name)
  end
end