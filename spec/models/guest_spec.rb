require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should have_many :stays }
    it { should have_many(:rooms), through: :stays }
  end

  describe "add_room_by_id" do
    before do
      @hotel_1 = Hotel.create!(name: "Best Eastern", location: "123 Highway 21")
      @guest_1 = Guest.create!(name: "John Smith")
      @room_1 = @hotel_1.rooms.create!(suite: "Master", rate: 300)
      @room_2 = @hotel_1.rooms.create!(suite: "Economy", rate: 100)
  
      Stay.create!(guest: @guest_1, room: @room_1)
    end

    it "adds a room by id" do
      @guest_1.add_room_by_id(@room_2.id)

      expect(@guest_1.rooms).to include(@room_2)
    end
  end
end