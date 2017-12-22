require_relative("../models/genre")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/stock")
require_relative("../models/purchase")
require_relative("../models/sale")
require_relative("../models/supplier")
require("time")
require("pry-byebug")

Sale.delete_all()
Purchase.delete_all()
Stock.delete_all()
Supplier.delete_all()
Album.delete_all()
Artist.delete_all()
Genre.delete_all()

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
genre5 = Genre.new({"name" => "Pop"})
genre5.save()
genre6 = Genre.new({"name" => "Progressive rock"})
genre6.save()
genre7 = Genre.new({"name" => "Disco"})
genre7.save()

artist1 = Artist.new({
  "name" => "Nicola Benedetti",
  "type" => "Solo"
  })
artist1.save()
artist2 = Artist.new({
  "name" => "Queen",
  "type" => "Band"
  })
artist2.save()
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


album1 = Album.new({
  "title" => "Homecoming: A Scottish Fantasy",
  "year" => "2014",
  "artist_id" => artist1.id,
  "genre_id" => genre1.id
  })
album1.save()
album2 = Album.new({
  "title" => "Greatest Hits I",
  "year" => "1981",
  "artist_id" => artist2.id,
  "genre_id" => genre3.id
  })
album2.save()
album3 = Album.new({
  "title" => "Greatest Hits II",
  "year" => "1991",
  "artist_id" => artist2.id,
  "genre_id" => genre3.id
  })
album3.save()
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


artist11 = Artist.new({"name" => "Electric Light Orchestra", "type" => "Band"})
artist11.save
artist12 = Artist.new({"name" => "Eric Clapton", "type" => "Solo"})
artist12.save
artist13= Artist.new({"name" => "Fats Domino", "type" => "Solo"})
artist13.save
artist14= Artist.new({"name" => "Genesis", "type" => "Band"})
artist14.save
artist15= Artist.new({"name" => "George Harrison", "type" => "Solo"})
artist15.save
artist16= Artist.new({"name" => "Rick Wakeman", "type" => "Solo"})
artist16.save
artist17= Artist.new({"name" => "Santana", "type" => "Band"})
artist17.save
artist18= Artist.new({"name" => "Status Quo", "type" => "Band"})
artist18.save
artist19= Artist.new({"name" => "The Doors", "type" => "Band"})
artist19.save
artist20= Artist.new({"name" => "The Proclaimers", "type" => "Band"})
artist20.save
artist21= Artist.new({"name" => "Yes", "type" => "Band"})
artist21.save
artist22= Artist.new({"name" => "Bee Gees", "type" => "Band"})
artist22.save
artist23= Artist.new({"name" => "Bruce Springsteen", "type" => "Solo"})
artist23.save
artist24= Artist.new({"name" => "Simon and Garfunkel", "type" => "Band"})
artist24.save

album13 = Album.new({"artist_id" => artist11.id, "title" => "The Collection", "genre_id" => genre3.id})
album13.save
album14 = Album.new({"artist_id" => artist10.id,	"title" => "On the Border", "genre_id" => genre3.id})
album14.save
album15 = Album.new({"artist_id" => artist12.id,	"title" => "Strictly the Blues", "genre_id" => genre3.id})
album15.save
album16 = Album.new({"artist_id" => artist12.id,	"title" => "Pilgrim", "genre_id" => genre3.id})
album16.save
album17 = Album.new({"artist_id" => artist13.id,	"title" => "Fats Domino", "genre_id" => genre3.id})
album17.save
album18 = Album.new({"artist_id" => artist6.id,	"title" => "Green Shadows", "genre_id" => genre3.id})
album18.save
album20 = Album.new({"artist_id" => artist14.id,	"title" => "I can’t Dance", "genre_id" => genre3.id})
album20.save
album22 = Album.new({"artist_id" => artist15.id,	"title" => "All Things Must Pass", "genre_id" => genre3.id})
album22.save
album23 = Album.new({"artist_id" => artist2.id,	"title" => "Made in Heaven", "genre_id" => genre3.id})
album23.save
album24 = Album.new({"artist_id" => artist16.id,	"title" => "Out There", "genre_id" => genre3.id})
album24.save
album25 = Album.new({"artist_id" => artist17.id,	"title" => "Santana", "genre_id" => genre3.id})
album25.save
album26 = Album.new({"artist_id" => artist18.id, 	"title" => "12 Gold Bars", "genre_id" => genre3.id})
album26.save
album27 = Album.new({"artist_id" => artist19.id,	"title" => "The Doors", "genre_id" => genre3.id})
album27.save
album28 = Album.new({"artist_id" => artist20.id,	"title" => "The Best of…", "genre_id" => genre3.id})
album28.save
album29 = Album.new({"artist_id" => artist21.id,	"title" => "In a Word", "genre_id" => genre3.id})
album29.save
album30 = Album.new({"artist_id" => artist22.id,	"title" => "Saturday Night Fever", "year" => "1977", "genre_id" => genre7.id})
album30.save
album31 = Album.new({"artist_id" => artist9.id,	"title" => "Abbey Road",	"year" => "1969",	"genre_id" =>	genre3.id})
album31.save
album32 = Album.new({"artist_id" => artist10.id,	"title" => "Born in the USA",	"year" => "1984",	"genre_id" =>	genre3.id})
album32.save
album33 = Album.new({"artist_id" => artist5.id,	"title" => "The Wall",	"year" => "1979",	"genre_id" =>	genre6.id})
album33.save
album34 = Album.new({"artist_id" => artist12.id,	"title" => "Unplugged",	"year" => "1992",	"genre_id" =>	genre3.id})
album34.save
album35 = Album.new({"artist_id" => artist24.id,	"title" => "Bridge over troubled water",	"year" => "1970", "genre_id" =>	genre3.id})
album35.save

supplier1 = Supplier.new({
  "company" => "Test Company", "address" => "1 Test Street", "phone" => "01234567", "email" => "test@company.com", "website" => "http://www.google.com"
  })
supplier1.save()
supplier2 = Supplier.new({
  "company" => "Supplier", "address" => "2 Supplier Street", "phone" => "058215435", "email" => "company@supplier.com", "website" => "http://www.google.com"
  })
supplier2.save()
supplier3 = Supplier.new({
  "company" => "Example", "address" => "3 Example Street", "phone" => "0238761425", "email" => "example@company.com", "website" => "http://www.google.com"
  })
supplier3.save()
supplier4 = Supplier.new({
  "company" => "Album Seller", "address" => "4 New Street", "phone" => "0234876435", "email" => "album@supplier.com", "website" => "http://www.google.com"
  })
supplier4.save()


stock1 = Stock.new({
  "album_id" => album3.id,
  "quantity" => 20,
  "low_stock_level" => 5,
  "high_stock_level" => 15,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier1.id
  })
stock1.save()
stock2 = Stock.new({
  "album_id" => album2.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier1.id
  })
stock2.save()
stock3 = Stock.new({
  "album_id" => album4.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£8.00",
  "sell_price" => "£12.00",
  "supplier_id" => supplier1.id
  })
stock3.save()
stock4 = Stock.new({
  "album_id" => album5.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier1.id
  })
stock4.save()
stock5 = Stock.new({
  "album_id" => album6.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier2.id
  })
stock5.save()
stock6 = Stock.new({
  "album_id" => album7.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier2.id
  })
stock6.save()
stock7 = Stock.new({
  "album_id" => album8.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier3.id
  })
stock7.save()
stock8 = Stock.new({
  "album_id" => album9.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier4.id
  })
stock8.save()
stock9 = Stock.new({
  "album_id" => album10.id,
  "quantity" => 10,
  "low_stock_level" => 5,
  "high_stock_level" => 10,
  "buy_price" => "£5.00",
  "sell_price" => "£10.00",
  "supplier_id" => supplier3.id
  })
stock9.save()



purchase1 = Purchase.new({
  "stock_id" => stock1.id,
  "time" => Time.now,
  "quantity" => 10
  })
purchase2 = Purchase.new({
  "stock_id" => stock2.id,
  "time" => Time.now,
  "quantity" => 10
  })
  purchase1.save()
  purchase2.save()
purchase3 = Purchase.new({
  "stock_id" => stock3.id,
  "time" => Time.now,
  "quantity" => 10
  })
purchase4 = Purchase.new({
  "stock_id" => stock4.id,
  "time" => Time.now,
  "quantity" => 10
  })
purchase3.save()
purchase4.save()
purchase5 = Purchase.new({
  "stock_id" => stock5.id,
  "time" => Time.now,
  "quantity" => 10
  })
purchase6 = Purchase.new({
  "stock_id" => stock6.id,
  "time" => Time.now,
  "quantity" => 10
  })
purchase5.save()
purchase6.save()




binding.pry
nil
