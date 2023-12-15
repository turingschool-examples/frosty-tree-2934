RSpec.describe "Hotel Show Page", type: :feature do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Best Eastern", location: "123 Highway 21")
    @hotel_2 = Hotel.create!(name: "Blue Roof Inn", location: "321 Main St")

    @guest_1 = Guest.create!(name: "John Smith")

    @room_1 = @hotel_1.rooms.create!(suite: "Master", rate: 300)
    @room_2 = @hotel_1.rooms.create!(suite: "Economy", rate: 100)
    @room_3 = @hotel_1.rooms.create!(suite: "Deluxe", rate: 200)

    @room_4 = @hotel_2.rooms.create!(suite: "Master", rate: 300)
    @room_5 = @hotel_2.rooms.create!(suite: "Economy", rate: 100)
    @room_6 = @hotel_2.rooms.create!(suite: "Deluxe", rate: 200)

    Stay.create!(guest: @guest_1, room: @room_1)
    Stay.create!(guest: @guest_1, room: @room_2)
    Stay.create!(guest: @guest_1, room: @room_4)

    Stay.create!(guest: @guest_2, room: @room_1)
  end

  it "displays list of guests at hotel_1" do
    #extension
    
    #As a visitor
    #When I visit a hotels's show page
    visit "hotels/#{@hotel_1.id}"

    #Then I see a unique list of all guests that have stayed at this hotel.
    expect(page).to have_content(@guest_1.name)
    expect(page).to have_content(@guest_2.name)
  end

  it "displays list of guests at hotel_2" do
    #extension
    
    #As a visitor
    #When I visit a hotels's show page
    visit "hotels/#{@hotel_2.id}"

    #Then I see a unique list of all guests that have stayed at this hotel.
    expect(page).to have_content(@guest_1.name)
    expect(page).to_not have_content(@guest_2.name)
  end
end