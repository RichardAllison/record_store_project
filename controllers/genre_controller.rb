require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("../models/artist")
require_relative("../models/genre")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")

get("/genres") do
  @genres = Genre.all_sorted()
  erb(:"genres/index")
end

get("/genres/new") do
  erb(:"genres/new")
end

post("/genres") do
  @new_genre = Genre.new(params)
  @new_genre.save()
  erb(:"genres/create")
end

get("/genres/:id") do
  @genre = Genre.find(params["id"])
  @albums = Album.find_all_by_genre(params["id"])
  erb(:"genres/show")
end

get("/genres/:id/edit") do
  id = params["id"]
  @genre = Genre.find(id)
  erb(:"genres/edit")
end

post("/genres/:id") do
  @genre = Genre.new(params)
  @genre.update()
  erb(:"genres/update")
end

post("/genres/:id/delete") do
  @genre = Genre.find(params["id"])
  @delete_message = @genre.delete()
  erb(:"genres/destroy")
end
