require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")

get("/stock") do
  @stocks = Stock.all_sorted()
  erb(:"stock/index")
end

get("/stock/new") do
  @requested_album_id = params['album_id'].to_i()
  @albums = Album.all()
  erb(:"stock/new")
end

get("/stock/not_in_stock") do
  @requested_album_id = params['album_id'].to_i()
  @album = Album.find(@requested_album_id)
  @albums = Album.all()
  erb(:"stock/not_in_stock")
end

get("/stock/:id") do
  @stock = Stock.find(params["id"])
  erb(:"stock/show")
end

post("/stock") do
  @new_stock = Stock.new(params)
  @save_message = @new_stock.save()
  erb(:"stock/create")
end

get("/stock/:id/edit") do
  id = params["id"]
  @stock = Stock.find(id)
  erb(:"stock/edit")
end

post("/stock/:id") do
  @stock = Stock.new(params)
  @stock.update()
  erb(:"stock/update")
end

post("/stock/:id/delete") do
  @stock = Stock.find(params["id"])
  @stock.delete()
  erb(:"stock/destroy")
end
