require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "relationships" do
    it { should have_many :stays }
    it { should have_many(:rooms), through: :stays }
  end
end