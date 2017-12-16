require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")

get("/albums") do
  @albums = Album.all()
  erb(:"albums/index")
end

get("/albums/new") do
  @artists = Artist.all()
  @genres = Genre.all()
  erb(:"albums/new")
end

post("/albums") do
  @new_album = Album.new(params)
  @new_album.save()
  erb(:"albums/create")
end

get("/albums/:id") do
  @album = Album.find(params["id"])
  erb(:"albums/show")
end

get("/albums/:id/edit") do
  id = params["id"]
  @album = Album.find(id)
  erb(:"albums/edit")
end

post("/albums/:id/delete") do
  @album = Album.find(params["id"])
  @album.delete()
  erb(:"albums/destroy")
end
