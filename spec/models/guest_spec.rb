require "rails_helper" 

RSpec.describe Guest do 
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do 
    it { should have_many :guest_rooms }
    it { should have_many(:rooms).through(:guest_rooms ) }
  end

  it "exists with a name and nights attributes" do 
    guest_charlize = Guest.create!(name: "Charlize Theron", nights: 3)

    expect(guest_charlize.name).to eq("Charlize Theron")
    expect(guest_charlize.nights).to eq(3)
  end
end 