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

restaurant4 = Restaurant.new({
  "name" => "Belted Burgers",
  "website" => "http://www.beltedburgers.co.uk/belted-edinburgh",
  "menu" => "http://www.beltedburgers.co.uk/pdf/edin_main_menu.pdf"
  })

restaurant4.save

restaurant5 = Restaurant.new({
  "name" => "The Other Place",
  "website" => "http://www.theotherplaceedinburgh.com/",
  "menu" => "http://www.theotherplaceedinburgh.com/images/top-main-menu.pdf"
  })

restaurant5.save

restaurant6 = Restaurant.new({
  "name" => "The City Cafe",
  "website" => "http://citycafeedinburgh.co.uk/",
  "menu" => "http://citycafeedinburgh.co.uk/main-menu/"
  })

restaurant5.save

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

deal4 = Deal.new({
  "name" => "Burger & Beer/Wine £10",
  "description" => "Available for all burger and selected drinks. Have to join burger society",
  "day_id" => day3.id,
  "restaurant_id" => restaurant4.id
  })

deal4.save

deal5 = Deal.new({
  "name" => "The Other Challenge",
  "description" => "The Challenge is to eat the triple chilli cheese burger with a side of chilli cheese fries and onions rings within a 20 minute time limit.

  The Challenge will cost £20, but if the challenger cleans the entire plate within the time limit, the meal and any drinks they have had during the challenge will be wiped from the bill.

  The successful challenger will also have his/her picture put up on the wall of fame.",
  "day_id" => day8.id,
  "restaurant_id" => restaurant5.id
  })

deal5.save

deal6 = Deal.new({
  "name" => "Ultimate Burger Challenge",
  "description" => "The Ultimate Burger has 3 homemade hamburgers, 2 marinated chicken breasts, 2 spicy bean burgers, 2 pineapple rings, bacon, mushrooms, gherkins, two types of cheese, guacamole, salad and more… all between a plate sized bun and served with a large portion of gourmet chips and coleslaw.

  The Ultimate Burger Challenge is £30.00. If you finish it all, you get it for FREE, as well as a t-shirt and your photo on the wall of fame!",
  "day_id" => day8.id,
  "restaurant_id" => restaurant6.id
  })

deal5.save

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