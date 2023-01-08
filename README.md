## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1 - Items, Attendees & Auctions

Use TDD to create Item, Attendee, & Auction that will respond to the interaction pattern below:

```ruby
pry(main)> require './lib/item'
#=> true
pry(main)> require './lib/auction'
#=> true
pry(main)> require './lib/attendee'
#=> true

pry(main)> item1 = Item.new('Chalkware Piggy Bank')
#=> #<Item:0x00007fbda98fa1b0 @bids={}, @name="Chalkware Piggy Bank">

pry(main)> item1.name
#=> "Chalkware Piggy Bank"

pry(main)> item2 = Item.new('Bamboo Picture Frame')
#=> #<Item:0x00007fbda91874f0 @bids={}, @name="Bamboo Picture Frame">

pry(main)> attendee = Attendee.new(name: 'Megan', budget: '$50')
#=> #<Attendee:0x00007fbda913f038 @budget=50, @name="Megan">

pry(main)> attendee.name
#=> "Megan"

pry(main)> attendee.budget
#=> 50

pry(main)> auction = Auction.new
#=> #<Auction:0x00007fbda90f1cc0 @items=[]>

pry(main)> auction.items ----
#=> []

pry(main)> auction.add_item(item1)
pry(main)> auction.add_item(item2)

pry(main)> auction.items
#=> [#<Item:0x00007fbda98fa1b0 ...>, #<Item:0x00007fbda91874f0 ...>]

pry(main)> auction.item_names
#=> ["Chalkware Piggy Bank", "Bamboo Picture Frame"]

```

## Iteration 2 - Bidding!

Use TDD to update your classes to respond to the following interaction pattern.  Some notes:
- `unpopular_items` are those items which have no bids.
- `potential_revenue` is the total possible sale price of the items (the items highest bid)

```ruby
pry(main)> require './lib/item'
#=> true

pry(main)> require './lib/auction'
#=> true

pry(main)> require './lib/attendee'
#=> true

pry(main)> item1 = Item.new('Chalkware Piggy Bank')
#=> #<Item:0x00007fdc07956ab0 @bids={}, @name="Chalkware Piggy Bank">

pry(main)> item2 = Item.new('Bamboo Picture Frame')
#=> #<Item:0x00007fdc07925280 @bids={}, @name="Bamboo Picture Frame">

pry(main)> item3 = Item.new('Homemade Chocolate Chip Cookies')
#=> #<Item:0x00007fdc071ab040 @bids={}, @name="Homemade Chocolate Chip Cookies">

pry(main)> item4 = Item.new('2 Days Dogsitting')
#=> #<Item:0x00007fdc088fb6f0 @bids={}, @name="2 Days Dogsitting">

pry(main)> item5 = Item.new('Forever Stamps')
#=> #<Item:0x00007fdc071695f0 @bids={}, @name="Forever Stamps">

pry(main)> attendee1 = Attendee.new(name: 'Megan', budget: '$50')
#=> #<Attendee:0x00007fdc088f0e08 @budget=50, @name="Megan">

pry(main)> attendee2 = Attendee.new(name: 'Bob', budget: '$75')
#=> #<Attendee:0x00007fdc071131c8 @budget=75, @name="Bob">

pry(main)> attendee3 = Attendee.new(name: 'Mike', budget: '$100')
#=> #<Attendee:0x00007fdc070e2190 @budget=100, @name="Mike">

pry(main)> auction = Auction.new
#=> #<Auction:0x00007fdc0799de60 @items=[]>

pry(main)> auction.add_item(item1)

pry(main)> auction.add_item(item2)

pry(main)> auction.add_item(item3)

pry(main)> auction.add_item(item4)

pry(main)> auction.add_item(item5)

pry(main)> item1.bids
#=> {}

pry(main)> item1.add_bid(attendee2, 20)

pry(main)> item1.add_bid(attendee1, 22)

pry(main)> item1.bids
#=> {
#     #<Attendee:0x00007fdc071131c8 ...> => 20,
#     #<Attendee:0x00007fdc088f0e08 ...> => 22
#   }

pry(main)> item1.current_high_bid
#=> 22

pry(main)> item4.add_bid(attendee3, 50)

pry(main)> auction.unpopular_items
#=> [#<Item:0x00007fdc07925280 ...>, #<Item:0x00007fdc071ab040 ...>, #<Item:0x00007fdc071695f0 ...>]

pry(main)> item3.add_bid(attendee2, 15)

pry(main)> auction.unpopular_items
#=> [#<Item:0x00007fdc07925280 ...>, #<Item:0x00007fdc071695f0 ...>]

pry(main)> auction.potential_revenue
#=> 87

```

## Iteration 3 - More bidding stuff!

Use TDD to update your `Auction` class to add the following functionalilty:
- `bidders` should return an array of attendees who have placed a bid in the auction.
- `bidder_info` should return a hash with keys that are attendees, and values that are a hash with that attendee's budget and an array of items that attendee has bid on. (see example below)

```ruby
#=> {
 #    #<Attendee:0x00007ff177a45108 @budget=50, @name="Megan"> =>
 #      {
 #        :budget => 50,
 #        :items => [#<Item:0x00007ff17702e2a0 ...>]
 #      },
 #    #<Attendee:0x00007ff17816a4b0 @budget=75, @name="Bob"> =>
 #      {
 #        :budget => 75,
 #        :items => [#<Item:0x00007ff17702e2a0...>, #<Item:0x00007ff177ae45f0 ...>]
 #      },
 #    #<Attendee:0x00007ff177a0f5f8 @budget=100, @name="Mike"> =>
 #      {
 #        :budget => 100,
 #        :items => [#<Item:0x00007ff177a9d858...>]
 #      }
 #   }
 ```

- An Auction will now be created with a date - whatever date the event is created on through the use of `Date.today`. The addition of a date to the event should NOT break any previous tests.  The `date` method will return a string representation of the date - 'dd/mm/yyyy'. We want you to test this in with a date that is IN THE PAST. In order to test the date method in a way that will work today, tomorrow and on any date in the future, you will need to use a stub :)


## Iteration 4 - Closing the auction

Use TDD to update your `Item` and `Auction` classes to respond to the following interaction pattern.  Some notes:
- `close_bidding` should update the item so that it will not accept additional bids
- `close_auction` should close bidding and 'sell' items to attendees.  The method will return a hash with items as the keys, and the purchaser of that item as the values. Attendees will only purchase items that they can afford (their bid is less than their current budget).  If an attendee has bid on multiple items, they will purchase the items starting with the most expensive first, followed by the next most expensive, etc... while they still have enough money in their budget to pay for the item.  If the highest bidder for an item does not have enough budget to pay for the item, the next highest bidder will purchase the item.

```ruby 
# {
#   #<Item: ...> => #<Attendee: ...>,
#   #<Item: ...> => 'Not Sold',
#   #<Item: ...> => #<Attendee: ...>,
#   #<Item: ...> => #<Attendee: ...>,
#   #<Item: ...> => 'Not Sold'
# }
#
```
