require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/stock_controller')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')

get '/' do
  erb(:index)
end
