require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")
require_relative("../models/supplier")

get("/suppliers") do
  @suppliers = Supplier.all_sorted()
  erb(:"suppliers/index")
end

get("/suppliers/new") do
  erb(:"suppliers/new")
end

post("/suppliers") do
  @new_supplier = Supplier.new(params)
  @new_supplier.save()
  erb(:"suppliers/create")
end

get("/suppliers/:id") do
  @supplier = Supplier.find(params["id"])
  @stock_items = Stock.find_all_by_supplier(params["id"])
  erb(:"suppliers/show")
end
