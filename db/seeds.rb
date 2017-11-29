require_relative('../models/artist')
require_relative('../models/album')


artist1 = Artist.new({
  "name" => "Goatwhore",
  "logo" => "https://metalanarchydotcom.files.wordpress.com/2016/05/img_20160524_203409.jpg?w=549&h=568"
  })
artist2 = Artist.new({
  "name" => "Slayer",
  "logo" => "https://static1.squarespace.com/static/55ccf522e4b0fc9c2b651a5d/t/55cd0b92e4b0fe0a5d6dfc9c/1496716888398/"
  })
artist3 = Artist.new({
  "name" => "Shai Hulud",
  "logo" => "http://metalbladeftp.com/Logos/Shai%20Hulud%20-%20Logo.jpg"
  })
artist4 = Artist.new({
  "name" => "Skeletonwitch",
  "logo" => "https://vignette.wikia.nocookie.net/logopedia/images/a/a4/Skeletonwitch_logo_02.png/revision/latest?cb=20161025032948"
  })
artist5 = Artist.new({
  "name" => "Mastodon",
  "logo" => "https://www.altpress.com/images/uploads/news/mastodon_logo.png"
  })
artist6 = Artist.new({
  "name" => "Taylor Swift",
  "logo" => "http://thepacenews.com/wp-content/uploads/2017/08/Talor-Swift.jpg"
  })

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save

album1 = Album.new({
  "title" => "Vengeful Ascension",
  "artist" => artist1.id,
  "quantity" => 5,
  "buy_price" => 300,
  "sell_price" => 1000,
  "genre" => "Blackened Death Metal"
  })
album2 = Album.new({
  "title" => "Reign in Blood",
  "artist" => artist2.id,
  "quantity" => 10,
  "buy_price" => 300,
  "sell_price" => 1200,
  "genre" => "Thrash"
  })
album3 = Album.new({
  "title" => "Misanthropy Pure",
  "artist" => artist3.id,
  "quantity" =>12,
  "buy_price" => 400,
  "sell_price" => 900,
  "genre" => "Metalcore"
  })
album4 = Album.new({
  "title" => "Serpents Unleashed",
  "artist" => artist4.id,
  "quantity" => 6,
  "buy_price" => 300,
  "sell_price" => 1100,
  "genre" => "Death Metal"
  })
album5 = Album.new({
  "title" => "Seasons In The Abyss",
  "artist" => artist2.id,
  "quantity" => 2,
  "buy_price" => 250,
  "sell_price" => 900,
  "genre" => "Thrash"
  })
album6 = Album.new({
  "title" => "Constricting Rage of the Merciless",
  "artist" => artist1.id,
  "quantity" => 10,
  "buy_price" => 400,
  "sell_price" => 999,
  "genre" => "Blackened Death Metal"
  })
album7 = Album.new({
  "title" => "Leviathan",
  "artist" => artist5.id,
  "quantity" => 12,
  "buy_price" => 360,
  "sell_price" =>1300,
  "genre" => "Heavy Metal"
  })
album8 = Album.new({
  "title" => "1989",
  "artist" => artist6.id,
  "quantity" => 40,
  "buy_price" => 250,
  "sell_price" => 890,
  "genre" => "Pop"
  })



album1.save
album2.save
album3.save
album4.save
album5.save
album6.save
album7.save
