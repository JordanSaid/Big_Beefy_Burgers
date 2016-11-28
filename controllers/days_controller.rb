require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/restaurant_deal.rb' )
require('pry-byebug') 

get '/days' do
  @days = Day.all()
  erb ( :"days/index" )
end

get '/days/:id' do
  @day = Day.find( params[:id] )
  @deals = Deal.all
  erb(:"days/show")
end
  
