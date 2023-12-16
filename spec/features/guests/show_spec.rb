require "rails_helper" 

RSpec.describe "the guest show page" do 
  before(:each) do 
    @hotel_echo = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @hotel_cascade = Hotel.create!(name: "Vail Cascade", location: "Vail Mountain")
    @guest_charlize = Guest.create!(name: "Charlize Theron", nights: 3)
    @room_pres = Room.create!(rate: 125, suite: "Presidential", hotel_id: @hotel_echo.id)
    @room_honey = Room.create!(rate: 100, suite: "Honeymoon", hotel_id: @hotel_echo.id)
    @room_view_1 = Room.create!(rate: 500, suite: "View 1", hotel_id: @hotel_cascade.id)
    @guest_room_pres = @guest_charlize.rooms << @room_pres
    @guest_room_honey = @guest_charlize.rooms << @room_honey
  end

  it "it shows the guest's name" do 
    visit "/guests/#{@guest_charlize.id}"

    expect(page).to have_content("Guest Information")
    expect(page).to have_content("Charlize Theron")
  end

  it "has a list of all the rooms the guest has stayed in, including the room's suite, nightly rate, and hotel name" do 
    visit "/guests/#{@guest_charlize.id}"

    @guest_charlize.rooms.each do |room| 
      expect(page).to have_content("Suite: #{room.suite}")
      expect(page).to have_content("Rate: #{room.rate}")
      expect(page).to have_content("Hotel: #{@hotel_echo.name}")
    end
  end

  it "has a form to add a room to a guest" do 
    visit "/guests/#{@guest_charlize.id}"

    expect(page).to have_content("Enter room id:")
    expect(page).to have_field(:room_id)
    expect(page).to have_button("Submit")

    fill_in(:room_id, with: @room_view_1.id)

    click_button "Submit" 
        
    expect(current_path).to eq("/guests/#{@guest_charlize.id}")
  end

end 