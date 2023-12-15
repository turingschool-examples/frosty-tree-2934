require "rails_helper"

RSpec.describe "the guest show" do
    before(:each) do
        @holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
        @honeymoon_suite = @holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
        @florence = @honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
        @oval_suite = @holiday_inn.rooms.create(rate: 100, suite: "Oval")
        @bupkis_suite = @holiday_inn.rooms.create(rate: 2000, suite: "Bupkis")
        @oval_suite.add_guest_to_room(@florence.id)
    end
    
    it "shows the guest and all its attributes" do
        visit "/guests/#{@florence.id}"

        expect(page).to have_content("Guest: #{@florence.name}")
        expect(page).to have_content("Nights: #{@florence.nights}")
    end

    it "shows the guest's rooms, including the rooms' suite, rate, and hotel" do
        visit "/guests/#{@florence.id}"

        expect(page).to have_content("Suite Hotel: #{@oval_suite.hotel.name}")
        expect(page).to have_content("Suite Name: #{@oval_suite.suite}")
        expect(page).to have_content("Suite Rate: #{@oval_suite.rate}")
    end

    it "contains a form that adds room to guest when provided room id" do
        visit "/guests/#{@florence.id}"

        expect(page).to have_field("Add a room for #{@florence.name}")
        expect(page).to have_button("Add Room")

        fill_in "Add a room for #{@florence.name}:", with: "#{@bupkis_suite.id}"
        click_button "Add Room"

        expect(page).to have_content("Suite Hotel: #{@bupkis_suite.hotel.name}")
        expect(page).to have_content("Suite Name: #{@bupkis_suite.suite}")
        expect(page).to have_content("Suite Rate: #{@bupkis_suite.rate}")
    end
end
