require "rails_helper"

RSpec.describe "the guest show page", type: :feature do

  it "shows a list of all the rooms a guest has stayed in" do
    hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    room_1 = Hotel.room.create!(rate: 125, suite: "Presidential")
    room_2 = Hotel.room.create!(rate: 5, suite: "Squatter")
    guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)

    # When I visit a guest's show page
    visit "/guests/#{guest.id}"
    
    # I see the guest's name
    expect(page).to have_content(guest_1.name)
    # And I see a list of all the rooms they've stayed in
    expect(page).to have_content(room_1.name)
    expect(page).to have_content(room_1.name)
    # including the room's suite, nightly rate, 
    
    # and the name of the hotel that it belongs to.

  end
end