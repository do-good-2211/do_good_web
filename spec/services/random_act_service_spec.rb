require "rails_helper"

RSpec.describe RandomActService, :vcr do
  it "returns a json object" do
    data = RandomActService.get_acts

    expect(data).to be_a(Hash)
    expect(data[:data].keys).to eq([:id, :type, :attributes])
    expect(data[:data][:attributes].keys).to eq([:deed_names])
    expect(data[:data][:attributes][:deed_names]).to be_an(Array)
  end
end
