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

get("/artists/new") do
  erb(:"artists/new")
end

post("/artists") do
  @new_artist = Artist.new(params)
  @new_artist.save()
  erb(:"artists/create")
end

get("/artists/:id") do
  @artist = Artist.find(params["id"])
  @albums = Album.find_all_by_artist(params["id"])
  erb(:"artists/show")
end

get("/artists/:id/edit") do
  id = params["id"]
  @artist = Artist.find(id)
  erb(:"artists/edit")
end

post("/artists/:id") do
  @artist = Artist.new(params)
  @artist.update()
  erb(:"artists/update")
end

post("/artists/:id/delete") do
  @artist = Artist.find(params["id"])
  @delete_message = @artist.delete()
  erb(:"artists/destroy")
end
