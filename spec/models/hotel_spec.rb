require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "class methods" do
    it "should exist, and have a name and location" do
      holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
      honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
      florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
      
      expect(holiday_inn).to be_a Hotel
      expect(holiday_inn.name).to eq("Holiday Inn")
      expect(holiday_inn.location).to eq("Mars")
    end
  end
end