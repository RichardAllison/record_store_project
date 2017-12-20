require_relative("../db/sql_runner")
require("pry-byebug")

class Album

  attr_reader(:id, :title, :year, :artist_id, :genre_id)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @year = options["year"].to_i()
    @artist_id = options["artist_id"].to_i()
    @genre_id = options["genre_id"].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, year, artist_id, genre_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@title, @year, @artist_id, @genre_id]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end


  def update()
    sql = "UPDATE albums SET (title, year, artist_id, genre_id) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@title, @year, @artist_id, @genre_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    unless Stock.check_album(@id)
      sql = "DELETE FROM albums WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
      return "#{title} deleted."
    else
      return "#{title} could not be deleted."
    end
  end

  def genre()
    return Genre.find(@genre_id)
  end

  def artist()
    return Artist.find(@artist_id)
  end

  def stock()
    return Stock.find_by_album(@id)
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    album_hashes = SqlRunner.run(sql)
    albums = album_hashes.map { |album_hash| Album.new(album_hash)}
    return albums
  end

  def Album.all_sorted()
    albums = Album.all()
    return albums.sort_by { |album| album.title }
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    album_hash = result.first()
    return Album.new(album_hash)
  end

  def Album.find_all_by_genre(genre_id)
    sql = "SELECT * FROM albums WHERE genre_id = $1;"
    values = [genre_id]
    result = SqlRunner.run(sql, values)
    album_hashes = result.map { |album_hash| Album.new(album_hash)}
    return album_hashes
  end

  def Album.find_all_by_artist(artist_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [artist_id]
    result = SqlRunner.run(sql, values)
    album_hashes = result.map { |album_hash| Album.new(album_hash)}
    return album_hashes
  end

  def Album.check_genre(genre_id)
    albums = Album.all()
    album_genre_ids = albums.map { |album| album.genre_id }
    return album_genre_ids.include?(genre_id)
  end

  def Album.check_artist(artist_id)
    albums = Album.all()
    album_artist_ids = albums.map { |album| album.artist_id }
    return album_artist_ids.include?(artist_id)
  end

  def Album.delete_all()
    SqlRunner.run("DELETE FROM albums;")
  end

end
