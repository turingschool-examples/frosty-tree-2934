require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should belong_to :reservation }
    it { should belong_to :room }
  end
end
