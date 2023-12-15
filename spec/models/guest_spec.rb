require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "class methods" do
    it "should exist, and have a name and number of nights stay" do
      holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
      honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
      florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
    
      expect(florence).to be_a Guest
      expect(florence.name).to eq("Florence Pugh")
      expect(florence.nights).to eq(12)
    end
  end
end