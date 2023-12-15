require 'rails_helper'

RSpec.describe "Guest Show Page", type: :feature do
  it ' shows a guests name' do 
    hotel1 = Hotel.create(name: "Luxury Resort", location: "Some Location")
    hotel2 = Hotel.create(name: "Comfort Inn", location: "Another Location")

    room1 = Room.create(rate: 150, suite: "Presidential", hotel: hotel1)
    room2 = Room.create(rate: 100, suite: "Deluxe", hotel: hotel2)

    guest = Guest.create(name: "John Doe")
    guest.rooms << room1
    guest.rooms << room2
    
    visit "/guests/#{guest.id}"

   expect(page).to have_content("Guest: #{guest.name}")

   expect(page).to have_content("Room: #{room1.suite}, Rate: $#{room1.rate}")
   expect(page).to have_content("Room: #{room2.suite}, Rate: $#{room2.rate}")
   
   expect(page).to have_content("Room: #{room1.suite}, Rate: $#{room1.rate}, Hotel: #{hotel1.name}")
  end
end