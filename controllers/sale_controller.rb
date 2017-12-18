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
