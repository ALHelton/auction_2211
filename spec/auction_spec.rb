require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  let(:auction) { Auction.new }

  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }

  let(:attendee) { Attendee.new(name: 'Megan', budget: '$50') }


  describe '#initialize' do
    it "exists" do
      expect(auction).to be_an_instance_of(Auction)
    end
  end

  describe '#add_item' do
    it "add items to array" do
      expect(auction.items).to eq([])

      auction.add_item(item1)
      auction.add_item(item2)
      expect(auction.items).to eq([item1, item2])
    end
  end

end