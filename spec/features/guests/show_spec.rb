require "rails_helper"

RSpec.describe "the guest show" do
    before(:each) do
        @holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
        @honeymoon_suite = @holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
        @florence = @honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
    end
    
    it "shows the guest and all its attributes" do
        visit "/guests/#{@florence.id}"

        expect(page).to have_content("Guest: #{@florence.name}")
        expect(page).to have_content("Nights: #{@florence.nights}")
    end

    it "shows the guest's rooms, including the rooms' suite, rate, and hotel" do
        visit "/guests/#{@florence.id}"

        expect(page).to have_content("Guest: #{@florence.name}")
        expect(page).to have_content("Nights: #{@florence.nights}")
    end
end
