require "rails_helper"

RSpec.describe "Guest Show Page", type: :feature do
  before(:each) do
    @turing = Hotel.create!(name: "Turing", location: "Colorado")
    @fsa = Hotel.create!(name: "Fullstack Academy", location: "New York")

    @turing_single_suite = Room.create!(rate: 130, suite: "Single", hotel_id: @turing.id)
    @fsa_single_suite = Room.create!(rate: 150, suite: "Single", hotel_id: @fsa.id)

    @reservation_fsa = Reservation.create!(room_id: @fsa_single_suite.id, guest_id: @rob.id)
    @reservation_turing = Reservation.create!(room_id: @turing_single_suite.id, guest_id: @rob.id)

    @rob = Guest.create!(name: "Rob", nights: 4, room_id: @turing.id)
  end
  describe "User Story 1" do
    it "has information on the guest and their stays" do
      visit "/guests/#{@rob.id}"

      expect(page).to have_content("Rob")
      expect(page).to have_content("Rooms Stayed In:")

      within ("rooms-stayed-in:") do
        expect(page).to have_content("Room Suite: Single")
        expect(page).to have_content("Nightly Rate: 130")
        expect(page).to have_content("Name of Hotel: Turing")

        expect(page).to have_content("Room Suite: Single")
        expect(page).to have_content("Nightly Rate: 150")
        expect(page).to have_content("Name of Hotel: Fullstack Academy")
      end
    end
  end
end
