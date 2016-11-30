require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/restaurant_deal.rb')

get '/deals' do
  @days = Day.all
  @deals = Deal.all
  erb ( :"deals/index" )
end

get '/deals/new' do
  @restaurants = Restaurant.all
  @days = Day.all
  @deals = Deal.all
  erb(:"deals/new")
end

get '/deals/:id' do
  @days = Day.all
  @restaurants = Restaurant.all()
  @deal = Deal.find( params[:id] )
  erb(:"deals/show")
end

post '/deals' do
  deal = Deal.new(params)
  deal.save
  redirect to("/deals")
end

get '/deals/:id/edit' do
  @days = Day.all
  @restaurants = Restaurant.all
  @deal = Deal.find( params[:id] )
  erb(:"deals/edit")
end

post '/deals/:id' do
  deal = Deal.update( params )
  redirect to("/deals/#{params[:id]}")
end

post '/deals/:id/delete' do
  Deal.destroy( params[:id])
  redirect to("/deals") 
end