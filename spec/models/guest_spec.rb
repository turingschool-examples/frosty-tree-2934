require "rails_helper"

RSpec.describe Guest, type: :model do

  describe "relationships" do
    it { should belong_to(:rooms) }
    it { should have_many(:rooms) }
  end

  # describe "" do
  #   it "" do
  #     expect().to eq()
  #   end
  # end

end