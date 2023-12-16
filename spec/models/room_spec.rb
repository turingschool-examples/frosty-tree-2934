require "rails_helper"

RSpec.describe Room, type: :model do
  describe "validations" do 
    it { should validate_presence_of :suite }
    it { should validate_presence_of :rate }
    # it { should validate_numericality_of(:rate) }
  end

  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
  end



end