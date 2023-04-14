require 'rails_helper'

RSpec.describe RandomAct do 
  let(:random_act) { RandomAct.new("Pick or buy flowers for your mother.") }

  it "exists & has attributes" do
    expect(random_act).to be_a(RandomAct)
    expect(random_act.name).to eq("Pick or buy flowers for your mother.")
  end
end