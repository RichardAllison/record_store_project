require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/artist")
require_relative("../models/genre")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")

get("/sales") do
  @sales = Sale.all()
  erb(:"sales/index")
end

get("/sales/new") do
  @stocks = Stock.all_sorted()
  erb(:"sales/new")
end

post("/sales") do
  @new_sale = Sale.new(params)
  @new_sale.save()
  @new_sale.update_stock_amount()
  erb(:"sales/create")
end

get("/sales/:id") do
  @sale = Sale.find(params["id"])
  erb(:"sales/show")
end

post("/sales/:id/delete") do
  @sale = Sale.find(params["id"])
  @sale.delete()
  erb(:"sales/destroy")
end

post("/sales/delete") do
  Sale.delete_all()
  erb(:"sales/destroy_all")
end
