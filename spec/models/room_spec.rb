require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guests }
  end

  before(:each) do
    @turing = Hotel.create!(name: "Turing", location: "Colorado")
    @fsa = Hotel.create!(name: "Fullstack Academy", location: "New York")

    @turing_single_suite = Room.create!(rate: 130, suite: "Single", hotel_id: @turing.id)
    @fsa_single_suite = Room.create!(rate: 150, suite: "Single", hotel_id: @fsa.id)

    @rob = Guest.create!(name: "Rob", nights: 4)

    @reservation_fsa = Reservation.create!(room_id: @fsa_single_suite.id, guest_id: @rob.id)
    @reservation_turing = Reservation.create!(room_id: @turing_single_suite.id, guest_id: @rob.id)
  end

  describe "find_hotel" do
    it "can find the hotel of a room" do
      expect(@fsa_single_suite.find_hotel).to eq("Fullstack Academy")
      expect(@turing_single_suite.find_hotel).to eq("Turing")
    end
  end

  describe "#number_of_guests" do
    it "can find how many guests have stayed in a room" do
      expect(@fsa_single_suite.number_of_guests).to eq(1)
    end
  end
end
