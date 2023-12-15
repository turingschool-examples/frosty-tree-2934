require 'rails_helper'

RSpec.describe 'the admin apps index', type: :feature do
  describe 'As a visitor' do # As a visitor
    before(:each) do
      @hotel_1 = Hotel.create!(name: 'Mega Hotel', location: 'Denver' )
      @room_1 = @hotel_1.rooms.create!(suite: 'Standard', rate: 50 )
      @guest_1 = @room_1.guests.create!(name: 'Mike Tyson', nights: 0 )
      # in order to create a Room i need a Guest, but in order to create a Guest i need a Room
    end

    # Story 1
    it "Story 1" do 
        # When I visit a guest's show page
        visit "/guests/#{@guest_1.id}"
        # I see the guest's name
        expect(page).to have_content("Mike Tyson")
    end
  end 
end


