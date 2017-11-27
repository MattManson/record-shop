# require( 'pry-byebug' )
require_relative('../db/sql_runner')
require_relative('./album')
require_relative('./artist')

class Genre
  attr_reader :id, :genre

  def initialize(options)
    @id = options['id'].to_i
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO genres
    (
      genre
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@genre]
    genre = SqlRunner.run(sql, values)
    @id = genre.first()['id'].to_i
  end
# binding.pry
  def self.find( id )
    sql = "SELECT * FROM genres
    WHERE id = $1"
    values = [id]
    genre = SqlRunner.run( sql, values )
    result = Genre.new( genre.first )
    return result
  end

  def self.all
    sql = "SELECT * FROM genres"
    values = []
    genres = SqlRunner.run( sql, values )
    result = genres.map { |genre| Genre.new( genre ) }
    return result
  end

  def update
    sql = "UPDATE genre
    SET(name) = ($1)
    WHERE id = $2"
    values = [@genre]
    SqlRunner.run( sql, values )
  end

  def delete(id)
    sql = "DELETE FROM genres WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete_all
    sql = "DELETE FROM genres"
    values = []
    SqlRunner.run( sql, values )
  end

end
nil


def genre
  sql = "SELECT genres.genre FROM genres
  INNER JOIN artists
  ON genres.id = artists.genre
  WHERE artists.id = $1"
  values = [@id]
  genre = SqlRunner.run( sql, values )
  result = Genre.new(genre.first)
  return result.genre
end


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
