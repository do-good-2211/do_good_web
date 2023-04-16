require "rails_helper"

RSpec.describe GoodDeedFacade, :vcr do
  before do
    @facade = GoodDeedFacade.new({
                                  id: 1, 
                                  name: "High-five a stranger.",
                                   date: "02-02-2024",
                                   time: "2000-01-01T16:00:00.000Z",
                                   attendees: [1]
                                 }, 2)
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

  describe "#create_deed" do
    it "returns a good deed object with its respective attributes" do
      good_deed = @facade.create_deed

      expect(good_deed).to be_a Deed
      expect(good_deed.id).to be_an Integer
      expect(good_deed.name).to be_a String
    end
  end

  describe "#fetch_deed" do
    it 'returns a good deed object with its respective attributes' do
      good_deed = @facade.fetch_deed

      expect(good_deed).to be_a Deed
      expect(good_deed.id).to be_an Integer
      expect(good_deed.name).to be_a String
      expect(good_deed.date).to be_a String
      expect(good_deed.time).to be_a String
      expect(good_deed.status).to be_a String
      expect(good_deed.notes).to be_a(String).or eq(nil)
      expect(good_deed.media_link).to be_a(String).or eq(nil)
    end
  end
end
