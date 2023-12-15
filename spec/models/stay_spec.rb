require "rails_helper"

RSpec.describe Stay, type: :model do
  describe "relationships" do
    it { should belong_to(:guest) }
    it { should belong_to(:room) }
  end
end