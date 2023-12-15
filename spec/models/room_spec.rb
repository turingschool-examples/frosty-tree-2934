require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
  end

  describe "class methods" do
    it "should exist, and have a rate and suite" do
    room = Room.new(rate: 450, suite: "Honeymoon")
    
    expect(room).to be_a Room
    expect(room.rate).to eq(450)
    expect(room.suite).to eq("Honeymoon")
    end
  end
end