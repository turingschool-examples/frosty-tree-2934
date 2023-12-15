require "rails_helper"

RSpec.describe "Rooms Index Page", type: :feature do
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

  describe "User Story 3" do
    it "has a list of all rooms and their information" do
      visit "/rooms/index"

      expect(page).to have_content("Turing")
      expect(page).to have_content("Fullstack Academy")
      expect(page).to have_content("Hack Reactor")

      within "#room-#{@turing_single_suite.id}" do
        expect(page).to have_content("Suite: Single")
        expect(page).to have_content("Rate: 130")
        expect(page).to have_content("Hotel: Turing")
        expect(page).to have_content("Number of guests stayed: ")
      end
    end
  end
end
