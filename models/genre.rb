require_relative("../db/sql_runner")
require("pry-byebug")

class Genre

  attr_reader(:id, :name)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO genres (name) VALUES ($1) RETURNING id;"
    values = [@name]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE genres SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    unless Album.check_genre(@id)
      sql = "DELETE FROM genres WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
      return "The genre \"#{@name}\" has been deleted."
    end
    if Album.check_genre(@id)
      return "Could not delete genre \"#{@name}\"."
    end
  end

  def Genre.all()
    sql = "SELECT * FROM genres;"
    genre_hashes = SqlRunner.run(sql)
    genres = genre_hashes.map { |genre_hash| Genre.new(genre_hash)}
    return genres
  end

  def Genre.all_sorted()
    genres = Genre.all()
    return genres.sort_by { |genre| genre.name }
  end

  def Genre.find(id)
    sql = "SELECT * FROM genres WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    genre_hash = result.first()
    return Genre.new(genre_hash)
  end

  def Genre.delete_all()
    SqlRunner.run("DELETE FROM genres;")
  end

end
