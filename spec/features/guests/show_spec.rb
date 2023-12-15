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

  it "displays guest name, rooms they've stayed in, and room details" do
    visit "/guests/#{@guest_2.id}"

    expect(page).to have_content("#{@guest_2.name}")

    within("#rooms") do
      expect(page).to have_content("#{@guest_2.rooms.first.hotel.name}")
      expect(page).to have_content("#{@guest_2.rooms.first.suite}")
      expect(page).to have_content("#{@guest_2.rooms.first.rate}")

      expect(page).to have_content("#{@guest_2.rooms.second.hotel.name}")
      expect(page).to have_content("#{@guest_2.rooms.second.suite}")
      expect(page).to have_content("#{@guest_2.rooms.second.rate}")
    end
  end

  it "has a form to add a room to a given guest" do
    visit "/guests/#{@guest_1.id}"

    expect(page).to have_content("Room ID")
    expect(page).to have_button("Submit")

    fill_in("Room ID", with: "#{@room_2.id}")
    click_button("Submit")

    expect(current_path).to eq("/guests/#{@guest_1.id}")
    expect(page).to have_content("#{@room_2.hotel.name}")
    expect(page).to have_content("#{@room_2.suite}")
    expect(page).to have_content("#{@room_2.rate}")

    visit "/guests/#{@guest_2.id}"

    fill_in("Room ID", with: "#{@room_3.id}")
    click_button("Submit")

    expect(current_path).to eq("/guests/#{@guest_2.id}")
    expect(page).to have_content("#{@room_3.hotel.name}")
    expect(page).to have_content("#{@room_3.suite}")
    expect(page).to have_content("#{@room_3.rate}")
  end

end