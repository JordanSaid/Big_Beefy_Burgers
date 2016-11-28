require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/day.rb' )

get '/days' do
  @days = Day.all()
  erb ( :"days/index" )
end