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
day8 = Day.find(8)

restaurant1 = Restaurant.new({
  "name" => "Chanter",
  "website" => "http://www.thechanterpub.co.uk/",
  "menu" => "http://www.thechanterpub.co.uk/resource/binary//c3434f43c94a8d3324871645bd2e65a0/PP60970G7-PHOTO-GTP1-SCOTTISH-G7.pdf"
  })

restaurant1.save

restaurant2 = Restaurant.new({
  "name" => "Burger Meats Bun",
  "website" => "http://www.burger-meats-bun.co.uk/",
  "menu" => "https://static1.squarespace.com/static/5540c310e4b089664a9b9d33/t/557ef72ae4b0db2f0d136b7d/1434384170070/BMB-Main-Menu.pdf"
  })

restaurant2.save

restaurant3 = Restaurant.new({
  "name" => "Candy Bar & Kitchen",
  "website" => "http://www.candybaredinburgh.co.uk/",
  "menu" => "http://www.candybaredinburgh.co.uk/tasks/render/file/?fileid=C869A149-1DD8-B71C-70D7F9720356FD4A"
  })

restaurant3.save

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

burger3 = Burger.new({
  "name" => "Beefburger",
  "restaurant_id" => restaurant2.id
  })

burger3.save

burger4 = Burger.new({
  "name" => "Cheeseburger",
  "restaurant_id" => restaurant3.id
  })

burger4.save

deal1 = Deal.new({
  "name" => "Burger and a Drink",
  "description" => "Enjoy either a classic beef burger or southern-fried chicken burger with a drink for only £7.29",
  "day_id" => day8.id,
  "restaurant_id" => restaurant1.id
  })

deal1.save

deal2 = Deal.new({
  "name" => "2 for 1 Burgers",
  "description" => "Applies to all burgers and selected drinks",
  "day_id" => day3.id,
  "restaurant_id" => restaurant2.id
  })

deal2.save

deal3 = Deal.new({
  "name" => "Burger Wednesdays - Burger, Beer and Ben & Jerries £10",
  "description" => "BBQ bacon cheese burger, Chilli Cheese burger, Mushroom Swiss burger, Black & Blue Burger, Mexican burger",
  "day_id" => day3.id,
  "restaurant_id" => restaurant3.id
  })

deal3.save


restaurant_deal1 = RestaurantDeal.new({
  "burger_id" => burger1.id,
  "deal_id" => deal1.id
  })

restaurant_deal1.save

restaurant_deal2 = RestaurantDeal.new({
  "burger_id" => burger2.id,
  "deal_id" => deal1.id
  })

restaurant_deal2.save


binding.pry
nil