require "rails_helper"

RSpec.describe "The good deeds service" do
  describe "Class Methods" do
    before do
      deeds = File.read("./spec/fixtures/good_deeds.json")
      stub_request(:get, "http://localhost:3000/api/v1/good_deeds").to_return(status: 200, body: deeds)
    end
    it "returns a json object" do
      data = GoodDeedService.good_deeds

      expect(data).to be_a(Hash)
      data[:data].each do |deed|
        expect(deed).to have_key(:id)
        expect(deed).to have_key(:type)
        expect(deed).to have_key(:attributes)
        expect(deed[:attributes]).to have_key(:name)
        expect(deed[:attributes][:name]).to be_a(String)
        expect(deed[:attributes]).to have_key(:media_link)
        expect(deed[:attributes][:media_link]).to be_a(String)
      end
    end
  end
end
