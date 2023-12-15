require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guests }
  end

  it "should exist, and have a rate and suite" do
    holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
    honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
    florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
  
    expect(honeymoon_suite).to be_a Room
    expect(honeymoon_suite.rate).to eq(25)
    expect(honeymoon_suite.suite).to eq("Honeymoon")
  end

  describe "instance methods" do
    describe ".add_guest_to_room" do
      it "adds a guest to a room" do
        holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
        honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
        oval_suite = holiday_inn.rooms.create(rate: 100, suite: "Oval")
        florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
        
        oval_suite.add_guest_to_room(florence.id)
        expect(florence.rooms).to include(honeymoon_suite, oval_suite)
      end

      it "counts the number of guests" do
        holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
        honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
        oval_suite = holiday_inn.rooms.create(rate: 100, suite: "Oval")
        florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)
        
        expect(oval_suite.count_guests).to eq(0)
        expect(honeymoon_suite.count_guests).to eq(1)
      end
    end
  end
end