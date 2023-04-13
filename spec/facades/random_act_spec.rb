require "rails_helper"
require "./app/facades/random_act_facade"

RSpec.describe RandomActFacade do
  before do
    random_acts = File.read("./spec/fixtures/random_acts.json")
    stub_request(:get, "http://localhost:3000/api/v1/random_acts")
      .to_return(status: 200, body: random_acts)

    @facade = RandomActFacade.new
  end

  describe "initialize" do
    it "exists" do
      expect(@facade).to be_instance_of(RandomActFacade)
    end
  end

  describe "#methods" do
    it "returns an array of random act objects and it name" do
      acts = @facade.create_acts
     
      expect(acts).to be_an(Array)
      expect(acts.size).to eq(3)
      expect(acts.first.name).to be_a(String)
      expect(acts.first).to be_an_instance_of(RandomAct)
    end
  end
end
