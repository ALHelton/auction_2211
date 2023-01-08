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
    nobid_items = []
    @items.each do |item|
      if item.bids == nil
        nobid_items << item
      end
    end
    nobid_items
  end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      item.bids.each do |bid|
        if item.bids.count > 1
          revenue += item.bids.values.max
          # require 'pry'; binding.pry
        else
          require 'pry'; binding.pry
          revenue += bid.last
        end
      end
    end
    revenue
  end

end
