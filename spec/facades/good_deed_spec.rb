require "rails_helper"
require "./app/facades/good_deed_facade"

RSpec.describe GoodDeedFacade do
  before do
    deeds = File.read("./spec/fixtures/good_deeds.json")
    stub_request(:get, "https://localhost:3000/api/v1/good_deeds").to_return(status: 200, body: deeds)

    @facade = GoodDeedFacade.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@facade).to be_an_instance_of(GoodDeedFacade)
    end
  end

  describe "#methods" do
    it "retuns an array of good deed objects with their respective attributes" do
      good = @facade.get_deeds
      expect(good).to be_a(Array)
      good.each do |deed|
        expect(deed.id).to be_a(Integer)
        expect(deed.name).to be_a(String)
        expect(deed.media_link).to be_a(String)
      end

    end
  end




end
