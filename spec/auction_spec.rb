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


end