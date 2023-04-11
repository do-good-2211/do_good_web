require 'rails_helper'

RSpec.describe Test do
  describe 'test 1' do
    it "exists" do
      world = Test.new(name: 'world')

      expect(world).to be_a(Test)
    end
  end
end