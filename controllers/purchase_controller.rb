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
