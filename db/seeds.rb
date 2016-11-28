require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/restaurant_deal.rb' )
require('pry-byebug')

day1 = Day.find(1)
day2 = Day.find(2)
day3 = Day.find(3)
day4 = Day.find(4)
day5 = Day.find(5)
day6 = Day.find(6)
day7 = Day.find(7)

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

deal2 = Deal.new({
  "name" => "Cheeseburger and a pint £7.99",
  "description" => "Applies to all burgers and selected drinks",
  "day_id" => day1.id,
  "restaurant_id" => restaurant1.id
  })

deal2.save

deal3 = Deal.new({
  "name" => "Veggie Burger and a pint £7.99",
  "description" => "Applies to all burgers and selected drinks",
  "day_id" => day1.id,
  "restaurant_id" => restaurant2.id
  })

deal3.save


restaurant_deal1 = RestaurantDeal.new({
  "burger_id" => burger1.id,
  "deal_id" => deal1.id
  })

restaurant_deal1.save

binding.pry
nil