require "rails_helper"

RSpec.describe "Guest Show Page", type: :feature do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Best Eastern", location: "123 Highway 21")
    @guest_1 = Guest.create!(name: "John Smith")
    @room_1 = @hotel_1.rooms.create!(suite: "Master", rate: 300)
    @room_2 = @hotel_1.rooms.create!(suite: "Economy", rate: 100)

    Stay.create!(guest: @guest_1, room: @room_1)
    Stay.create!(guest: @guest_1, room: @room_2)
  end

  it "displays guests's information and list of rooms" do
  #Story 1
  #Guest Show
  
  #As a visitor
  #When I visit a guest's show page
  visit "guests/#{@guest_1.id}"

  #I see the guest's name
  expect(page).to have_content(@guest_1.name)
  #And I see a list of all the rooms they've stayed in
  expect(page).to have_content(@room_1.suite)
  expect(page).to have_content(@room_2.suite)

  #including the room's suite, nightly rate, and the name of the hotel that it belongs to.
  expect(page).to have_content(@room_1.rate)
  expect(page).to have_content(@room_2.rate)
  expect(page).to have_content(@hotel_1.name)
  end
end