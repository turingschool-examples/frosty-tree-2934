require "rails_helper"

RSpec.describe "Room Index Page", type: :feature do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Best Eastern", location: "123 Highway 21")
    @guest_1 = Guest.create!(name: "John Smith")
    @guest_2 = Guest.create!(name: "Jane Smith")
    @room_1 = @hotel_1.rooms.create!(suite: "Master", rate: 300)
    @room_2 = @hotel_1.rooms.create!(suite: "Economy", rate: 100)
    @room_3 = @hotel_1.rooms.create!(suite: "Deluxe", rate: 200)

    Stay.create!(guest: @guest_1, room: @room_1)
    Stay.create!(guest: @guest_1, room: @room_2)
    Stay.create!(guest: @guest_2, room: @room_1)
  end

  it "shows the room's info as well as number of guests" do
    #Story 3
    #Rooms Index

    #As a visitor
    #When I visit the rooms index page
    visit "/rooms/"
    
    #Then I see a list of all rooms
    expect(page).to have_content("#{@room_1.name}")
    expect(page).to have_content("#{@room_2.name}")
    expect(page).to have_content("#{@room_3.name}")

    #including the room's suite, nightly rate, and the name of the hotel that it belongs to
    expect(page).to have_content("#{@room_1.rate}")
    expect(page).to have_content("#{@room_2.rate}")
    expect(page).to have_content("#{@room_3.rate}")

    expect(page).to have_content("#{@hotel_1.name}")

    #and the number of guests that have stayed in that room.

    expect(page).to have_content("2 Guest Stay(s)")
    expect(page).to have_content("1 Guest Stay(s)")
    expect(page).to have_content("0 Guest Stay(s)")
  end
end