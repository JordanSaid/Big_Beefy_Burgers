require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/restaurant_deal.rb')

get '/restaurants' do
  @restaurants = Restaurant.all
  @deals = Deal.all
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

get '/restaurants/:id' do
  @restaurant_deals = RestaurantDeal.all
  @burgers = Burger.all
  @deals = Deal.all
  @restaurant = Restaurant.find( params[:id] )
  erb(:"restaurants/show")
end

get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find( params[:id] )
  erb(:"restaurants/edit")
end

post '/restaurants/:id' do
  restaurant = Restaurant.update( params )
  redirect to("/restaurants/#{params[:id]}")
end

post '/restaurants/:id/delete' do Restaurant.destroy( params[:id])
  redirect to("/restaurants") 
end