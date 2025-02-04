require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  let(:auction) { Auction.new }

  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }


  let(:attendee) { Attendee.new(name: 'Megan', budget: '$50') }
  let(:attendee1) { Attendee.new(name: 'Megan', budget: '$50') }
  let(:attendee2) { Attendee.new(name: 'Bob', budget: '$75') }
  let(:attendee3) { Attendee.new(name: 'Mike', budget: '$100') }


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
      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe '#unpopular_items' do
      xit "#unpopular_items" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      expect(item1.bids).to eq({})

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      item4.add_bid(attendee3, 50)
      expect(auction.unpopular_items).to eq([item2, item3, item5])

      item3.add_bid(attendee2, 15)
      expect(auction.unpopular_items).to eq([item2, item5])
    end

    xit "#potential_revenue" do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.potential_revenue).to eq(87)
    end
  end

end