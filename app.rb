require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/days_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/restaurants_controller')

get '/' do
  erb( :index )
end