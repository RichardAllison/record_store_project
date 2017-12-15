require_relative("../db/sql_runner")
require("pry-byebug")

class Album

  attr_reader(:id, :title, :artist_id, :genre_id)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @artist_id = options["artist_id"].to_i()
    @genre_id = options["genre_id"].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, artist_id, genre_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @artist_id, @genre_id]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE albums SET (title, artist_id, genre_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@title, @artist_id, @genre_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def genre()
    return Genre.find(@genre_id)
  end

  def artist()
    return Artist.find(@artist_id)
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    album_hashes = SqlRunner.run(sql)
    albums = album_hashes.map { |album_hash| Album.new(album_hash)}
    return albums
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    album_hash = result.first()
    return Album.new(album_hash)
  end

  def Album.delete_all()
    SqlRunner.run("DELETE FROM albums;")
  end

end
