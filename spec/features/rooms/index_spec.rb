require "rails_helper"

RSpec.describe "the rooms index" do
    before(:each) do
        @holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
        @honeymoon_suite = @holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
        @oval_suite = @holiday_inn.rooms.create(rate: 100, suite: "Oval")
        @bupkis_suite = @holiday_inn.rooms.create(rate: 2000, suite: "Bupkis")
        @florence = @honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
        @tim = @honeymoon_suite.guests.create(name: "Timothy Chalamet", nights: 2)
        @oval_suite.add_guest_to_room(@florence.id)
    end
    
    it "lists all the rooms with their attributes" do
        visit "/rooms"

        expect(page).to have_content("Suite Hotel: #{@honeymoon_suite.hotel.name}")
        expect(page).to have_content("Suite Name: #{@honeymoon_suite.suite}")
        expect(page).to have_content("Suite Rate: #{@honeymoon_suite.rate}")
        
        expect(page).to have_content("Suite Hotel: #{@oval_suite.hotel.name}")
        expect(page).to have_content("Suite Name: #{@oval_suite.suite}")
        expect(page).to have_content("Suite Rate: #{@oval_suite.rate}")
    end

    it "shows the count of guests in each room" do
        visit "/rooms"

        expect(page).to have_content("Number of Suite Guests: 2")
    end
end