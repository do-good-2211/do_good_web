require 'rails_helper'

RSpec.describe Deed do
  let(:info) { { id: "55", type: "good_deed", attributes: { deed_name: "High-five a stranger", media_link: "www.image.com/high_five_yo!" } } }
  let(:deed1) { Deed.new(info) }

  it "exists & has attributes" do
    expect(deed1).to be_a(Deed)
    expect(deed1.id).to eq(55)
    expect(deed1.name).to eq("High-five a stranger")
    expect(deed1.media_link).to eq("www.image.com/high_five_yo!")
  end
end
