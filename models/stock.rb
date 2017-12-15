require_relative("../db/sql_runner")
require("pry-byebug")

class Stock

  attr_reader(:id, :album_id, :quantity)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @album_id = options["album_id"].to_i()
    @quantity = options["quantity"].to_i()
  end

  def save()
    sql = "INSERT INTO stock (album_id, quantity) VALUES ($1, $2) RETURNING id;"
    values = [@album_id, @quantity]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE stock SET (album_id, quantity) = ($1, $2) WHERE id = $3;"
    values = [@album_id, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM stock WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def album()
    return Album.find(@album_id)
  end

  def Stock.all()
    sql = "SELECT * FROM stock;"
    stock_hashes = SqlRunner.run(sql)
    stock = stock_hashes.map { |stock_hash| Stock.new(stock_hash)}
    return stock
  end

  def Stock.find(id)
    sql = "SELECT * FROM stock WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    stock_hash = result.first()
    return Stock.new(stock_hash)
  end

  def Stock.delete_all()
    SqlRunner.run("DELETE FROM stock;")
  end

end
