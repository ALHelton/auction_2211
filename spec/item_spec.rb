require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }

  describe '#initialize' do
    it "exists" do
      expect(item1.name).to eq("Chalkware Piggy Bank")
    end

  end


end