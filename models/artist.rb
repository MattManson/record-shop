require_relative('../db/sql_runner')
require_relative('./album.rb')


class Artist
  attr_reader :id, :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = "INSERT INTO artists
    ( name, logo )
    VALUES
    ( $1, $2)
    RETURNING *"
    values = [@name, @logo]
    artist = SqlRunner.run(sql, values)
    @id = artist.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    artist = SqlRunner.run( sql, values )
    result = Artist.new( artist.first )
    return result
  end

  def self.all
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run( sql, values )
    result = artists.map { |artist| Artist.new( artist ) }
    return result
  end

  def update
    sql = "UPDATE artists
    SET( name, logo ) = ( $1, $2)
    WHERE id = $4"
    values = [@name, @logo]
    SqlRunner.run( sql, values )
  end

  def delete(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete_all
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run( sql, values )
  end

  def num_albums
    sql = "SELECT COUNT(*)
    FROM albums
    WHERE artist = $1"
    values = [@id]
    album_count = SqlRunner.run( sql, values )[0]["count"]
    # result = Album.new(albums.count)
    return album_count
  end

end
