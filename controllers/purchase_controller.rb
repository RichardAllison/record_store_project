require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/artist")
require_relative("../models/genre")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")

get("/purchases") do
  @purchases = Purchase.all()
  erb(:"purchases/index")
end

get("/purchases/new") do
  @stocks = Stock.all()
  erb(:"purchases/new")
end

post("/purchases") do
  @new_purchase = Purchase.new(params)
  @new_purchase.save()
  erb(:"purchases/create")
end

get("/purchases/:id") do
  @purchase = Purchase.find(params["id"])
  erb(:"purchases/show")
end

post("/purchases/:id/delete") do
  @purchase = Purchase.find(params["id"])
  @purchase.delete()
  erb(:"purchases/destroy")
end
