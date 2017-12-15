require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")

get("/stock") do
  @stocks = Stock.all()
  erb(:"stock/index")
end

get("/stock/new") do
  @albums = Album.all()
  erb(:"stock/new")
end

get("/stock/:id") do
  @stock_item = Stock.find(params[:id])
  erb(:"stock/show")
end

post("/stock") do
  @new_stock = Stock.new(params)
  @new_stock.save()
  erb(:"stock/create")
end
