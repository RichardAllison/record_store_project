require_relative("../models/genre")
require_relative("../models/artist")
require('pry-byebug')

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

binding.pry
nil
