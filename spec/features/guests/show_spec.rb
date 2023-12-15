require "rails_helper"

RSpec.describe "the guest show" do
  it "shows the guest and all its attributes" do
    holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
    honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
    florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)

    visit "/guests/#{florence.id}"

    expect(page).to have_content("Guest: #{florence.name}")
    expect(page).to have_content("Nights: #{florence.nights}")
  end
end
