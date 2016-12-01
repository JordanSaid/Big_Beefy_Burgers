require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/days_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/restaurants_controller')

get '/' do
  @deals = Deal.all
  @days = Day.all()
  erb( :index )
end