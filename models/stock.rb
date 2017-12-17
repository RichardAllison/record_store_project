require_relative("../db/sql_runner")
require("pry-byebug")

class Stock

  attr_reader(:id, :album_id, :quantity, :low_stock_level, :high_stock_level)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @album_id = options["album_id"].to_i()
    @quantity = options["quantity"].to_i()
    @low_stock_level = options["low_stock_level"].to_i()
    @high_stock_level = options["high_stock_level"].to_i()
  end

  def save()
    unless Stock.check_album(@album_id)
      sql = "INSERT INTO stock (album_id, quantity, low_stock_level, high_stock_level) VALUES ($1, $2, $3, $4) RETURNING id;"
      values = [@album_id, @quantity, @low_stock_level, @high_stock_level]
      @id = SqlRunner.run(sql, values).first()["id"].to_i()
    end
  end

  def update()
    sql = "UPDATE stock SET (album_id, quantity, low_stock_level, high_stock_level) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@album_id, @quantity, @low_stock_level, @high_stock_level, @id]
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

  def Stock.check_album(album_id)
    stocks = Stock.all()
    stock_album_ids = stocks.map { |stock| stock.album_id }
    return stock_album_ids.include?(album_id)
  end

  def Stock.delete_all()
    SqlRunner.run("DELETE FROM stock;")
  end

  def level()
    stock = Stock.find(@id)
    stock_level = stock.quantity
    low_stock_level = stock.low_stock_level
    high_stock_level = stock.high_stock_level
    if stock_level <= low_stock_level
      return "Low"
    elsif stock_level >= high_stock_level
      return "High"
    else
      return "Medium"
    end
  end

end
