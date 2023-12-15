require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "class methods" do
    it "should exist, and have a name and location" do
    inn = Hotel.new(name: "Doubletree Inn", location: "Barstow")
    
    expect(inn).to be_a Hotel
    expect(inn.name).to eq("Doubletree Inn")
    expect(inn.location).to eq("Barstow")
    end
  end
end