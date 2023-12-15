require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guests }
  end

  describe "class methods" do
    it "should exist, and have a rate and suite" do
      holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
      honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
      florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
    
      expect(honeymoon_suite).to be_a Room
      expect(honeymoon_suite.rate).to eq(25)
      expect(honeymoon_suite.suite).to eq("Honeymoon")
    end
  end
end