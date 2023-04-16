require "rails_helper"

RSpec.describe RandomActFacade, :vcr do
  before do
    @facade = RandomActFacade.new
  end

  describe "initialize" do
    it "exists" do
      expect(@facade).to be_instance_of(RandomActFacade)
    end
  end

  describe "#create_acts" do
    it "returns an array of random act objects and it name" do
      acts = @facade.create_acts

      expect(acts).to be_an(Array)
      expect(acts.size).to eq(3)
      expect(acts.first.name).to be_a(String)
      expect(acts.first).to be_an_instance_of(RandomAct)
    end
  end
end
