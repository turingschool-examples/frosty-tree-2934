require "rails_helper"

RSpec.describe "Rooms Index Page" do

  before(:each) do 
    @hotel_1 = Hotel.create!(name: "Marriott", location: "Silverthorne")
    @hotel_2 = Hotel.create!(name: "Hilton", location: "Breckenridge")

    @room_1 = Room.create!(rate: 200, suite: "Presidential", hotel_id: @hotel_1.id)
    @room_2 = Room.create!(rate: 100, suite: "Deluxe", hotel_id: @hotel_1.id)
    @room_3 = Room.create!(rate: 90, suite: "Standard", hotel_id: @hotel_2.id)

    @guest_1 = Guest.create!(name: "Michael Scott", nights: 1)
    @guest_2 = Guest.create!(name: "Dwight Schrute", nights: 2)
    @guest_3 = Guest.create!(name: "Jim Halpert", nights: 3)

    @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    @guest_room_2 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)
    @guest_room_3 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)
    @guest_room_4 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
  end

  it "displays all rooms, room details, and guests" do
    visit "/rooms"

    expect(page).to have_content("Hotel: #{@room_1.hotel.name}")
    expect(page).to have_content("Suite: #{@room_1.suite}")
    expect(page).to have_content("Rate: #{@room_1.rate}")
    expect(page).to have_content("Total Guests: #{@room_1.total_guests}")

    expect(page).to have_content("#{@room_2.hotel.name}")
    expect(page).to have_content("#{@room_2.suite}")
    expect(page).to have_content("#{@room_2.rate}")
    expect(page).to have_content("Total Guests: #{@room_2.total_guests}")

    expect(page).to have_content("#{@room_3.hotel.name}")
    expect(page).to have_content("#{@room_3.suite}")
    expect(page).to have_content("#{@room_3.rate}")
    expect(page).to have_content("Total Guests: #{@room_3.total_guests}")

  end

end