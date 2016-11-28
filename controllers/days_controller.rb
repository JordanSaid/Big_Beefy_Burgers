require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/day.rb' )

get '/days' do
  @days = Day.all()
  erb ( :"days/index" )
end

get '/days/:name' do
  @deals = Deal.all
  @day = Day.find_name( params[:"name"] )
  erb(:"days/show")
end