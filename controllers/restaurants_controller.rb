require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/burger_deal.rb')

get '/restaurants' do
  @restaurants = Restaurant.all
  erb ( :"restaurants/index" )
end

get '/restaurants/new' do
  @restaurants = Restaurant.all
  erb(:"restaurants/new")
end

post '/restaurants' do
  restaurant = Restaurant.new(params)
  restaurant.save
  redirect to("/restaurants")
end