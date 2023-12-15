require "rails_helper"

RSpec.describe GuestRoom, type: :model do
  describe "relationships" do
    it { should have_many :guests }
    it { should have_many :rooms }
  end

end