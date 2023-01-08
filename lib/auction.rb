class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    @items.each do |item|
      nobid_items = []
      if item.bids.nil? == true
        nobid_items << item
      end
      nobid_items
    end
  end

end

# if item.bids.nil? == true
#   nobid_items << item
# end