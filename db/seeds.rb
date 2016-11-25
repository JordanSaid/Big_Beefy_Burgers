require_relative( '../models/burger.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/restaurant.rb' )
require('pry-byebug')

day1 = Day.new({
  "name" => "Monday"
  })
day1.save

binding.pry
nil