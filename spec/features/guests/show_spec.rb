require "rails_helper"

RSpec.describe "Guest Show Page" do
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

  it "" do
    visit "/guests/#{@guest_1.id}"


  end

end