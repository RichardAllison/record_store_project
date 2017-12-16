require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")

get("/artists") do
  @artists = Artist.all()
  erb(:"artists/index")
end
