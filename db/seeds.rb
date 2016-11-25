require_relative( '../models/burger.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/restaurant.rb' )
require('pry-byebug')

day1 = Day.new({
  "name" => "Monday"
  })
day1.save

burger1 = Burger.new({
  "name" => "Cheese Burger",
  "price" => 12.99
  })

burger1.save

deal1 = Deal.new({
  "name" => "Burger and a pint £7.99",
  "day_id" => day1.id
  })

deal1.save

binding.pry
nil