require "rails_helper"

RSpec.describe "the guest show" do
  it "shows the guest and all its attributes" do
    florence = Guest.new(name: "Florence Pugh", nights: 12)

    visit "/guests/#{florence.id}"

    expect(page).to have_content("Name: #{florence.name}")
    expect(page).to have_content("Nights: #{florence.nights}")
  end
end
