require "rails_helper"

RSpec.describe "The good deeds service", :vcr do
  describe "Class Methods" do
    describe '#good_deeds' do
      it "returns a json object" do
        data = GoodDeedService.good_deeds

        expect(data).to be_a(Hash)

        data[:data].each do |deed|
          expect(deed).to have_key(:id)
          expect(deed).to have_key(:type)
          expect(deed).to have_key(:attributes)
          expect(deed[:attributes]).to have_key(:name)
          expect(deed[:attributes][:deed_name]).to be_a(String)
          expect(deed[:attributes]).to have_key(:media_link)
          expect(deed[:attributes][:media_link]).to be_a(String)
        end
      end
    end

    describe '#fetch_deed()' do
      it 'returns a single deed and its attributes' do
        data = GoodDeedService.fetch_deed(1, 1)

        expect(data).to be_a(Hash)

        deed = data[:data]
          expect(deed).to have_key(:id)
          expect(deed).to have_key(:type)
          expect(deed).to have_key(:attributes)
          expect(deed[:attributes]).to have_key(:name)
          expect(deed[:attributes][:name]).to be_a(String)
          expect(deed[:attributes]).to have_key(:date)
          expect(deed[:attributes][:date]).to be_a(String)
          expect(deed[:attributes]).to have_key(:time)
          expect(deed[:attributes][:time]).to be_a(String)
          expect(deed[:attributes]).to have_key(:status)
          expect(deed[:attributes][:status]).to be_a(String)
          expect(deed[:attributes]).to have_key(:notes)
          expect(deed[:attributes][:notes]).to be_a(String).or eq(nil)
          expect(deed[:attributes]).to have_key(:media_link)
          expect(deed[:attributes][:media_link]).to be_a(String).or eq(nil)
      end
    end
  end
end
