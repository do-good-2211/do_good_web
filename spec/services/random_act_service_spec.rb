require "rails_helper"

RSpec.describe RandomActService do
  before do
    random_acts = File.read("./spec/fixtures/random_acts.json")
    stub_request(:get, "http://localhost:5/api/v1/random_acts")
      .to_return(status: 200, body: random_acts)
  end

  it "returns a json object" do
    data = RandomActService.get_acts

    expect(data).to be_a(Hash)
    expect(data[:data].keys).to eq([:id, :type, :attributes])
    expect(data[:data][:attributes].keys).to eq([:deed_names])
    expect(data[:data][:attributes][:deed_names]).to eq(["Deed 1", "Deed 2", "Deed 3"])
  end
end
