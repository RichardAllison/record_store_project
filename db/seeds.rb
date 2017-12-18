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
  "title" => "Homecoming: A Scottish Fantasy",
  "year" => "2014",
  "artist_id" => artist1.id,
  "genre_id" => genre1.id
  })
album2 = Album.new({
  "title" => "Greatest Hits I",
  "year" => "1981",
  "artist_id" => artist2.id,
  "genre_id" => genre3.id
  })
album3 = Album.new({
  "title" => "Greatest Hits II",
  "year" => "1991",
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
  "buy_price" => 5,
  "sell_price" => 10
  })

stock2 = Stock.new({
  "album_id" => album2.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => 5,
  "sell_price" => 10
  })
stock1.save()
stock2.save()


genre5 = Genre.new({"name" => "Pop"})
genre5.save()
genre6 = Genre.new({"name" => "Progressive rock"})
genre6.save()

artist3 = Artist.new({
  "name" => "Michael Jackson",
  "type" => "Solo"
  })
artist3.save()
artist4 = Artist.new({
  "name" => "AC/DC",
  "type" => "Band"
  })
artist4.save()
artist5 = Artist.new({
  "name" => "Pink Floyd",
  "type" => "Band"
  })
artist5.save()
artist6 = Artist.new({
  "name" => "Fleetwood Mac",
  "type" => "Band"
  })
artist6.save()

album4 = Album.new({
  "title" => "Thriller",
  "year" => "1982",
  "artist_id" => artist3.id,
  "genre_id" => genre5.id
  })
album4.save()
album5 = Album.new({
  "title" => "Back in Black",
  "year" => "1980",
  "artist_id" => artist4.id,
  "genre_id" => genre3.id
  })
album5.save()
album6 = Album.new({
  "title" => "The Dark Side of the Moon",
  "year" => "1973",
  "artist_id" => artist5.id,
  "genre_id" => genre6.id
  })
album6.save()
album7 = Album.new({
  "title" => "Rumours",
  "year" => "1977",
  "artist_id" => artist6.id,
  "genre_id" => genre3.id
  })
album7.save()

artist7 = Artist.new({
  "name" => "Led Zeppelin",
  "type" => "Band"
  })
artist7.save()
artist8 = Artist.new({
  "name" => "Celine Dion",
  "type" => "Solo"
  })
artist8.save()
artist9 = Artist.new({
  "name" => "The Beatles",
  "type" => "Band"
  })
artist9.save()
artist10 = Artist.new({
  "name" => "Eagles",
  "type" => "Band"
  })
artist10.save()

album8 = Album.new({
  "title" => "Led Zeppelin IV",
  "year" => "1971",
  "artist_id" => artist7.id,
  "genre_id" => genre3.id
  })
album8.save()

album9 = Album.new({
  "title" => "Bad",
  "year" => "1987",
  "artist_id" => artist3.id,
  "genre_id" => genre5.id
  })
album9.save()

album10 = Album.new({
  "title" => "Sgt. Pepper's Lonely Hearts Club Band",
  "year" => "1967",
  "artist_id" => artist9.id,
  "genre_id" => genre3.id
  })
album10.save()

album11 = Album.new({
  "title" => "Hotel California",
  "year" => "1976",
  "artist_id" => artist10.id,
  "genre_id" => genre3.id
  })
album11.save()

binding.pry
nil
