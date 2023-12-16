require "rails_helper"

RSpec.describe "the hotel index page" do 
  before(:each) do 
    @hotel_echo = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @hotel_cascade = Hotel.create!(name: "Vail Cascade", location: "Vail Mountain")
    @guest_charlize = Guest.create!(name: "Charlize Theron", nights: 3)
    @guest_flacco = Guest.create!(name: "Joe Flacco", nights: 6)
    @guest_nicholson = Guest.create!(name: "Jack Nicholson", nights: 6)
    @room_pres = Room.create!(rate: 125, suite: "Presidential", hotel_id: @hotel_echo.id)
    @room_honey = Room.create!(rate: 100, suite: "Honeymoon", hotel_id: @hotel_echo.id)
    @room_view_1 = Room.create!(rate: 500, suite: "View 1", hotel_id: @hotel_cascade.id)
    @charlize_pres = @guest_charlize.rooms << @room_pres
    @charlize_honey = @guest_charlize.rooms << @room_honey
    @charlize_view_1 = @guest_charlize.rooms << @room_view_1
    @flacco_pres = @guest_flacco.rooms << @room_pres
    @flacco_pres = @guest_flacco.rooms << @room_view_1
    @nicholson_honey = @guest_nicholson.rooms << @room_honey
    @nicholson_pres = @guest_nicholson.rooms << @room_pres
  end

  it "has a unique list of all guests that have stayed at this hotel" do 

    Hotel.all.each do |hotel|
      visit "/hotels/#{hotel.id}"

      expect(page).to have_content("#{hotel.name}'s Guest List")
      
      hotel.guest_list.each do |guest|
        within "#show-#{hotel.id}" do 
          expect(page).to have_content(guest.name)
        end
      end
    end
  end
        
end 