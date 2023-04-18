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
          expect(deed[:attributes][:name]).to be_a(String)
          expect(deed[:attributes]).to have_key(:media_link)
          expect(deed[:attributes][:media_link]).to be_a(String)
        end
      end
    end

    describe '#fetch_deed' do
      it 'returns a json object' do
        data = GoodDeedService.fetch_deed(1, 2)

        expect(data).to be_a(Hash)
        expect(data[:data]).to have_key(:id)
        expect(data[:data]).to have_key(:type)
        expect(data[:data]).to have_key(:attributes)

        deed = data[:data]

        expect(deed[:attributes]).to have_key(:name)
        expect(deed[:attributes][:name]).to be_a(String)
        expect(deed[:attributes]).to have_key(:date)
        expect(deed[:attributes][:date]).to be_a(String)
        expect(deed[:attributes]).to have_key(:time)
        expect(deed[:attributes][:time]).to be_a(String)
        expect(deed[:attributes]).to have_key(:media_link)
        expect(deed[:attributes][:media_link]).to be_a(String).or eq(nil)
      end
    end

    describe '#delete deed' do
      it 'deletes a good deed and returns a status 204' do
        # make the deed
        new_deed = DoGoodService.create_deed(2, {
                                               name: "High-five a stranger.",
                                               date: "02-02-2024",
                                               time: "2000-01-01T16:00:00.000Z",
                                               attendees: []
                                             })

        deed_id = new_deed[:data][:id]

        response = GoodDeedService.delete_deed(2, deed_id)
        expect(response.status).to eq(204)
      end
    end
  end
end
