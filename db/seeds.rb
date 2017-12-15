require_relative("../models/genre")
require_relative("../models/artist")
require('pry-byebug')

Artist.delete_all
Genre.delete_all

genre1 = Genre.new({
  "name" => "Classical"
  })
genre2 = Genre.new({
  "name" => "Folk"
  })
genre3 = Genre.new({
  "name" => "Rock"
  })
genre4 = Genre.new({
  "name" => "Jazz"
  })

genre1.save()
genre2.save()
genre3.save()
genre4.save()
# genre1.name = "Neo Classical"
# genre1.update() # needs attr_accessor on name to work

artist1 = Artist.new({
  "name" => "Nicola Benedetti",
  "type" => "soloist"
  })
artist2 = Artist.new({
  "name" => "Queen",
  "type" => "band"
  })
artist1.save()
artist2.save()
# artist1.type = "classical soloist"
# artist1.update # needs attr_accessor on type to work

binding.pry
nil
