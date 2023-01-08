require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  let(:attendee) { Attendee.new(name: 'Megan', budget: '$50') }

  describe '#initialize' do
    it "exists" do
      expect(attendee).to be_an_instance_of(Attendee)
    end

    it "has attributes" do
      expect(attendee.name).to eq("Megan")
      expect(attendee.budget).to eq(50)
    end

  end


end