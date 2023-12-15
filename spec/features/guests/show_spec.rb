require "rails_helper"

RSpec.describe "Guest Show Page", type: :feature do
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

  describe "User Story 1" do
    it "has information on the guest and their stays" do
      visit "/guests/#{@rob.id}"

      expect(page).to have_content("Rob")
      expect(page).to have_content("Rooms Stayed In:")

      within ("#rooms-stayed-in-#{@turing_single_suite.id}") do
        expect(page).to have_content("Room Suite: Single")
        expect(page).to have_content("Nightly Rate: 130")
        expect(page).to have_content("Name of Hotel: Turing")
      end

      within ("#rooms-stayed-in-#{@fsa_single_suite.id}") do
        expect(page).to have_content("Room Suite: Single")
        expect(page).to have_content("Nightly Rate: 150")
        expect(page).to have_content("Name of Hotel: Fullstack Academy")
      end
    end
  end

  describe "User Story 2" do
    it "has a form to add a room to this guest" do
      visit "/guests/#{@rob.id}"

      expect(page).to have_content("Suite ID:")
      expect(page).to have_button("Add Room")
    end

    it "redirects me back to the guest show page with the new room listed" do
      visit "/guests/#{@rob.id}"

      fill_in "Suite ID:", with: @hack_reactor_king_suite.id
      click_button("Add Room")
      expect(page.current_path).to eq("/guests/#{@rob.id}")
      expect(page).to have_content("Hack Reactor")
    end
  end
end
