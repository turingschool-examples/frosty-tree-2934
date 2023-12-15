require 'rails_helper'

RSpec.feature "Visitor views a guest's show page", type: :feature do
  scenario 'they see the guest name and list of rooms stayed in' do
    hotel1 = Hotel.create(:hotel, name: 'The Overlook', location: "Estes Park")
    hotel2 = Hotel.create(:hotel, name: "Stanley Hotel", location: "Estes Park")
    room1 = Room.create(:room, suite: 'Deluxe', rate: 150, hotel: hotel1, guest: guest1)
    room2 = Room.create(:room, suite: 'Presidential', rate: 300, hotel: hotel2, guest: guest1)
    guest1 = Room.create(:guest, name: 'Jack Nicholson')
    GuestRoom.create(:guest_rooms, guest: guest1, room: room1)
    GuestRoom.create(:guest_rooms, guest: guest1, room: room2)

    visit "/guests/#{guest1.id}"

    expect(current_path).to eq("/guests/#{guest1.id}")
    expect(page).to have_content('Jack Nicholson')
    expect(page).to have_content('Deluxe')
    expect(page).to have_content('150')
    expect(page).to have_content('The Overlook')
  end
end