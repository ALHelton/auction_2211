require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  let(:auction) { Auction.new }

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