require "rails_helper"

RSpec.describe DoGoodService, :vcr do
  describe '#create_user' do
    it "returns a json object of one user" do
      user = DoGoodService.create_user(omni_hash)

      expect(user).to be_a(Hash)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:name)
    end
  end

  it "returns a json object of a good deed" do
    good_deed = DoGoodService.create_deed(2, {
                                            name: "High-five a stranger.",
                                            date: "02-02-2024",
                                            time: "2000-01-01T16:00:00.000Z",
                                            attendees: [1]
                                          })

    expect(good_deed).to be_a(Hash)

    expect(good_deed[:data]).to have_key(:id)
    expect(good_deed[:data]).to have_key(:type)
    expect(good_deed[:data]).to have_key(:attributes)
    expect(good_deed[:data][:attributes]).to have_key(:name)
    expect(good_deed[:data][:attributes]).to have_key(:host_id)
    expect(good_deed[:data][:attributes]).to have_key(:date)
    expect(good_deed[:data][:attributes]).to have_key(:time)
    expect(good_deed[:data][:attributes]).to have_key(:status)
  end
end
