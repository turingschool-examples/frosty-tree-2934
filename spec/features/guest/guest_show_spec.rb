require "rails_helper"

RSpec.describe "the guest show page", type: :feature do

  it "shows a list of all the rooms a guest has stayed in" do
    hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    room_2 = hotel_1.rooms.create!(rate: 5, suite: "Squatter")
    guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)

    guest_1.rooms << room_1
    guest_1.rooms << room_2
    # When I visit a guest's show page
    visit "/guests/#{guest_1.id}"
    # save_and_open_page
    # I see the guest's name
    expect(page).to have_content(guest_1.name)
    # And I see a list of all the rooms they've stayed in including the room's suite, nightly rate, 
    expect(page).to have_content(room_1.suite)
    expect(page).to have_content(room_2.suite)
    expect(page).to have_content(room_1.rate)
    expect(page).to have_content(room_2.rate)
    # and the name of the hotel that it belongs to.
    expect(page).to have_content(hotel_1.name)
  end
  
  it "creates a form to add a guest to a room" do
    hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    room_2 = hotel_1.rooms.create!(rate: 5, suite: "Squatter")
    guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    
    # When I visit a guest's show page
    visit "/guests/#{guest_1.id}"
    # save_and_open_page
    expect(page).to_not have_content(room_1.suite)
    # Then I see a form to add a room to this guest.
    expect(page).to have_button("Add Room")
    
    # When I fill in a field with the id of an existing room
    fill_in "Room ID", with: room_1.id
    # And I click submit
    click_button "Add Room"
    # save_and_open_page
    # require 'pry'; binding.pry
    # Then I am redirected back to the guest's show page
    # And I see the room now listed under this guest's rooms.
    expect(current_path).to eq("/guests/#{guest.id}")
    expect(page).to have_content(room_1.rate)
    expect(page).to have_content(room_1.suite)
    # (You do not have to test for a sad path, for example if the ID submitted is not an existing room)
  end
end