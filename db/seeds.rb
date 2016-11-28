require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/restaurant_deal.rb' )
require('pry-byebug')

day1 = Day.new({
  "name" => "Monday"
  })
day1.save

restaurant1 = Restaurant.new({
  "name" => "Chanter",
  "menu" => "http://www.thechanterpub.co.uk/resource/binary//c3434f43c94a8d3324871645bd2e65a0/PP60970G7-PHOTO-GTP1-SCOTTISH-G7.pdf"
  })

restaurant1.save

restaurant2 = Restaurant.new({
  "name" => "Burger Meats Bun",
  "menu" => "https://static1.squarespace.com/static/5540c310e4b089664a9b9d33/t/557ef72ae4b0db2f0d136b7d/1434384170070/BMB-Main-Menu.pdf"
  })

restaurant2.save

burger1 = Burger.new({
  "name" => "Cheeseburger",
  "restaurant_id" => restaurant1.id
  })

burger1.save

burger2 = Burger.new({
  "name" => "Beefburger",
  "restaurant_id" => restaurant1.id
  })

burger2.save

deal1 = Deal.new({
  "name" => "Burger and a pint £7.99",
  "description" => "Applies to all burgers and selected drinks",
  "day_id" => day1.id,
  "restaurant_id" => restaurant1.id
  })

deal1.save

restaurant_deal1 = RestaurantDeal.new({
  "burger_id" => burger1.id,
  "deal_id" => deal1.id
  })

restaurant_deal1.save

binding.pry
nil