require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/artist")
require_relative("../models/genre")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")

get("/purchases") do
  @purchases = Purchase.all_sorted_by_order_time()
  erb(:"purchases/index")
end

get("/purchases/new") do
  @requested_stock_id = params["stock_id"].to_i()
  @suppliers = Supplier.all_sorted()
  @stocks = Stock.all_sorted()
  erb(:"purchases/new")
end

post("/purchases") do
  @new_purchase = Purchase.new(params)
  @new_purchase.save()
  erb(:"purchases/create")
end

get("/purchases/confirmed") do
  erb(:"purchases/update")
end

get("/purchases/:id") do
  @purchase = Purchase.find(params["id"])
  erb(:"purchases/show")
end

get("/purchases/:id/edit") do
  id = params["id"]
  @purchase = Purchase.find(id)
  erb(:"purchases/edit")
end

post("/purchases/:id") do
  @updated_purchase = Purchase.new(params)
  @updated_purchase.update_delivery_time()
  @purchase = Purchase.find(params["id"])
  @purchase.update_stock_amount() 
  redirect("/purchases/confirmed")
end


post("/purchases/:id/delete") do
  @purchase = Purchase.find(params["id"])
  @purchase.delete()
  erb(:"purchases/destroy")
end

post("/purchases/delete") do
  Purchase.delete_all()
  erb(:"purchases/destroy_all")
end
