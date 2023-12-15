require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  before(:each) do
    @turing = Hotel.create!(name: "Turing", location: "Colorado")
    @fsa = Hotel.create!(name: "Fullstack Academy", location: "New York")
    @hack_reactor = Hotel.create!(name: "Hack Reactor", location: "Phoenix")

    @turing_single_suite = Room.create!(rate: 130, suite: "Single", hotel_id: @turing.id)
    @fsa_single_suite = Room.create!(rate: 150, suite: "Single", hotel_id: @fsa.id)
    @hack_reactor_king_suite = Room.create!(rate: 300, suite: "King", hotel_id: @hack_reactor.id)

    @rob = Guest.create!(name: "Rob", nights: 4)

    @reservation_fsa = Reservation.create!(room_id: @fsa_single_suite.id, guest_id: @rob.id)
    @reservation_turing = Reservation.create!(room_id: @turing_single_suite.id, guest_id: @rob.id)
  end

  describe "#add_room" do
    it "adds an existing room to the guests' rooms" do
      expect(@rob.add_room(@hack_reactor_king_suite)).to eq([@turing_single_suite, @fsa_single_suite, @hack_reactor_king_suite])
    end
  end
end
