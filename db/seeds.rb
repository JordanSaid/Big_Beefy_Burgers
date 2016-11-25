require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/join.rb' )
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

deal1 = Deal.new({
  "name" => "Burger and a pint £7.99",
  "description" => "Applies to all burgers and selected drinks",
  "day_id" => day1.id,
  "restaurant_id" => restaurant1.id
  })

deal1.save

join1 = Join.new({
  "restaurant_id" => restaurant1.id,
  "deal_id" => deal1.id
  })

join1.save

binding.pry
nil