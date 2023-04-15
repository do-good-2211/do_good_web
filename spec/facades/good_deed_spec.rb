require "rails_helper"

RSpec.describe GoodDeedFacade, :vcr do
  before do
    @facade = GoodDeedFacade.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@facade).to be_an_instance_of(GoodDeedFacade)
    end
  end

  describe "#get_deeds" do
    it "retuns an array of good deed objects with their respective attributes" do
      good = @facade.get_deeds

      expect(good).to be_an(Array)

      good.each do |deed|
        expect(deed.id).to be_an(Integer)
        expect(deed.name).to be_a(String)
        expect(deed.media_link).to be_a(String)
      end
    end
  end
end
