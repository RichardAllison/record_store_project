require_relative("../db/sql_runner")
require("pry-byebug")

class Artist

  attr_reader(:id, :name, :type)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @type = options["type"]
  end

  def save()
    sql = "INSERT INTO artists (name, type) VALUES ($1, $2) RETURNING id;"
    values = [@name, @type]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE artists SET (name, type) = ($1, $2) WHERE id = $3;"
    values = [@name, @type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    unless Album.check_artist(@id)
      sql = "DELETE FROM artists WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
      return "\'#{@name}\' has been deleted."
    else
      return "Could not delete \'#{@name}\'."
    end
  end

  def Artist.all()
    sql = "SELECT * FROM artists;"
    artist_hashes = SqlRunner.run(sql)
    artists = artist_hashes.map { |artist_hash| Artist.new(artist_hash)}
    return artists
  end

  def Artist.all_sorted()
    artists = Artist.all()
    return artists.sort_by { |artist| artist.name }
  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist_hash = result.first()
    return Artist.new(artist_hash)
  end

  def Artist.delete_all()
    SqlRunner.run("DELETE FROM artists;")
  end

end
