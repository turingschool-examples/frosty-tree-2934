require "rails_helper"

RSpec.describe "Guest" do
  before (:each) do
    @hotel_1 = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @hotel_2 = Hotel.create!(name: "A-basin Hotel", location: "A-basin")

    @room_1 = @hotel_1.rooms.create!(rate: 100, suite: "Presidential")
    @room_2 = @hotel_1.rooms.create!(rate: 75, suite: "Regular")
    @room_3 = @hotel_1.rooms.create!(rate: 60, suite: "Economy")

    @room_4 = @hotel_2.rooms.create!(rate: 110, suite: "Imperial")
    @room_5 = @hotel_2.rooms.create!(rate: 85, suite: "Standard")
    @room_6 = @hotel_2.rooms.create!(rate: 70, suite: "Small")

    @guest_1 = Guest.create!(name: "George", nights: 2)
    @guest_2 = Guest.create!(name: "Suzy", nights: 3)
    @guest_3 = Guest.create!(name: "Will", nights: 4)
    @guest_4 = Guest.create!(name: "Philip", nights: 4)
    @guest_5 = Guest.create!(name: "Hank", nights: 1)

    @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    @guest_room_2 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)
    @guest_room_3 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_2.id)
    @guest_room_4 = GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_2.id)
  end


  it "has a show page that lists guest's name" do
    visit "/guests/#{@guest_1.id}"

    expect(page).to have_content(@guest_1.name)
    expect(page).to have_content("Presidential")
    expect(page).to have_content(100)
    expect(page).to have_content("Echo Mountain Inn")

  end

  it "can add a room to a guest" do
    visit "/guests/#{@guest_1.id}"

    expect(page).to have_field(:new_room)
    
    fill_in :new_room, with: (@room_4.id)
    click_button "Submit"

    expect(current_path).to eq("/guests/#{@guest_1.id}")
    expect(page).to have_content(@room_4.suite)
    expect(page).to have_content(@room_4.rate)
    expect(page).to have_content(@room_4.hotel.name)
  end
end