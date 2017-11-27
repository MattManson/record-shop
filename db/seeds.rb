require_relative('../models/artist')
require_relative('../models/album')
require_relative('../models/genre')

genre1 = Genre.new({
  "genre" => "Blackened Death Metal"
  })
genre2 = Genre.new({
  "genre" => "Thrash Metal"
  })
genre3 = Genre.new({
  "genre" => "Metalcore"
  })

genre1.save
genre2.save
genre3.save

artist1 = Artist.new({
  "name" => "Goatwhore",
  "logo" => "https://metalanarchydotcom.files.wordpress.com/2016/05/img_20160524_203409.jpg?w=549&h=568",
  "genre" => genre1.id
  })
artist2 = Artist.new({
  "name" => "Slayer",
  "logo" => "https://static1.squarespace.com/static/55ccf522e4b0fc9c2b651a5d/t/55cd0b92e4b0fe0a5d6dfc9c/1496716888398/",
  "genre" => genre2.id
  })
artist3 = Artist.new({
  "name" => "Shai Hulud",
  "logo" => "http://metalbladeftp.com/Logos/Shai%20Hulud%20-%20Logo.jpg",
  "genre" => genre3.id
  })
artist4 = Artist.new({
  "name" => "Skeletonwitch",
  "logo" => "https://vignette.wikia.nocookie.net/logopedia/images/a/a4/Skeletonwitch_logo_02.png/revision/latest?cb=20161025032948",
  "genre" => genre1.id
  })

artist1.save
artist2.save
artist3.save
artist4.save

album1 = Album.new({
  "title" => "Vengeful Ascension",
  "artist" => artist1.id,
  "quantity" => 5,
  "buy_price" => 3,
  "sell_price" => 10
  })
album2 = Album.new({
  "title" => "Reign in Blood",
  "artist" => artist2.id,
  "quantity" => 10,
  "buy_price" => 3,
  "sell_price" => 12
  })
album3 = Album.new({
  "title" => "Misanthropy Pure",
  "artist" => artist3.id,
  "quantity" =>12,
  "buy_price" => 4,
  "sell_price" => 9
  })
album4 = Album.new({
  "title" => "Serpents Unleashed",
  "artist" => artist4.id,
  "quantity" => 6,
  "buy_price" => 3,
  "sell_price" => 11
  })


album1.save
album2.save
album3.save
album4.save
