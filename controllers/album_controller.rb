require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")

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
  @genres = Genre.all()
  @artists = Artist.all()
  @album = Album.find(id)
  erb(:"albums/edit")
end

post("/albums/:id") do
  @album = Album.new(params)
  @album.update()
  erb(:"albums/update")
end

post("/albums/:id/delete") do
  @album = Album.find(params["id"])
  @delete_message = @album.delete()
  erb(:"albums/destroy")
end
