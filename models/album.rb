require_relative('../db/sql_runner')
require_relative('./artist.rb')

class Album
  attr_reader :id, :title, :artist, :quantity, :buy_price, :sell_price, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @artist = options['artist'].to_i
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO albums
    (
      title,
      artist,
      quantity,
      buy_price,
      sell_price,
      genre
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@title, @artist, @quantity, @buy_price, @sell_price, @genre]
    album = SqlRunner.run(sql, values)
    @id = album.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM albums
    WHERE id = $1"
    values = [id]
    album = SqlRunner.run( sql, values )
    result = Album.new( album.first )
    return result
  end

  def self.all
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run( sql, values )
    result = albums.map { |album| Album.new( album ) }
    return result
  end

  def artist
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist]
    artist = SqlRunner.run( sql, values )
    result = Artist.new( artist.first )
    return result
  end

  def update
    sql = "UPDATE albums
    SET(
    title,
    artist,
    quantity,
    buy_price,
    sell_price,
    genre
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@title, @artist, @quantity, @buy_price, @sell_price, @genre, @id]
    SqlRunner.run( sql, values )
  end

  def delete
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete_all
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run( sql, values )
  end

  def stock_level
    case @quantity
    when 0 then return "out of stock"
    when 1..5 then return "low"
    when 6..10 then return "medium"
    when 10..999 then return "high"
    end
  end

  def markup
    markup = ((@buy_price / @sell_price.to_f)*100)
    return markup
  end
  #
  # def genre
  #   sql = "SELECT genres.genre FROM genres
  #   INNER JOIN artists
  #   ON genres.id = artists.genre
  #   INNER JOIN albums
  #   ON albums.artist = artists.id
  #   WHERE albums.id = $1"
  #   values = [@id]
  #   genre = SqlRunner.run( sql, values )
  #   result = Genre.new( genre.first )
  #   return result.genre
  # end

end
