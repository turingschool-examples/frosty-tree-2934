require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
    it { should belong_to :room }
    it { should belong_to :hotel }
  end
end
