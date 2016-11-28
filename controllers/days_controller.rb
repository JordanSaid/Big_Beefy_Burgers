require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/day.rb' )

get '/days' do
  @days = Day.all()
  erb ( :"days/index" )
end

get '/days/:id' do
  @deals = Deal.all
  @day = Day.find( params[:id] )
  erb(:"days/show")
end