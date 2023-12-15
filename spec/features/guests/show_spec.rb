RSpec.describe "Guest's show page", type: :feature do 
  describe "US 1" do
    before(:each) do 
      @guest_1= Guest.create!(name:"Sam", nights:2)
      @guest_2= Guest.create!(name:"Zulu", nights:5)
      @guest_3= Guest.create!(name:"Tom", nights:10)

      @hotel_1=Hotel.create!(name:"Marriot",location:"DC")
      @hotel_2=Hotel.create!(name:"Holiday Inn",location:"Charlotte")
      @hotel_3=Hotel.create!(name:"Red Roof",location:"Arlington")

      @room_1 = @hotel_1.rooms.create!(rate:200, suite:"deluxe")
      @room_2 = @hotel_1.rooms.create(rate:500, suite:"executive")

      RoomGuest.create!(room_id:@room1.id, hotel_id:@hotel_1.id)
      RoomGuest.cretae!(room_id:@room2.id, hotel_id:@hotel_1.id)
     
        visit "/guests"
    end
  end 
    it "should see the guest's name" do 
       #within("guest-#@guest_1.id") do 
       expect(page).to have_content("Name:#{@guest_1.name}")
   # end 
        
        #within("guest-#@guest_2.id") do 
        expect(page).to have_content("Name:#{@guest_1.name}")
    #end 
         #within("guest-#@guest_3.id") do 
         expect(page).to have_content("Name:#{@guest_1.name}")
    #end
  end
 end
