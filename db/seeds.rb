require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")
require('pry-byebug')

Stock.delete_all
Album.delete_all
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

artist1 = Artist.new({
  "name" => "Nicola Benedetti",
  "type" => "Solo"
  })
artist2 = Artist.new({
  "name" => "Queen",
  "type" => "Band"
  })

artist1.save()
artist2.save()

album1 = Album.new({
  "title" => "Nicola Benedetti Homecoming: A Scottish Fantasy",
  "artist_id" => artist1.id,
  "genre_id" => genre1.id
  })
album2 = Album.new({
  "title" => "Greatest Hits I",
  "artist_id" => artist2.id,
  "genre_id" => genre3.id
  })
album3 = Album.new({
  "title" => "Greatest Hits II",
  "artist_id" => artist2.id,
  "genre_id" => genre3.id
  })
album1.save()
album2.save()
album3.save()

stock1 = Stock.new({
  "album_id" => album1.id,
  "quantity" => 20,
  "low_stock_level" => 5,
  "high_stock_level" => 15
  })

stock2 = Stock.new({
  "album_id" => album2.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10
  })
stock1.save()
stock2.save()


binding.pry
nil
