require("time")
require("pry-byebug")
require_relative("../db/sql_runner")

class Purchase

  attr_reader(:id, :stock_id, :time, :quantity, :arrival_time)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @stock_id = options["stock_id"].to_i() if options["stock_id"]
    @time = options["time"]
    @quantity = options["quantity"].to_i()
    @arrival_time = options["arrival_time"]
  end

  def save()
    sql = "INSERT INTO purchases (stock_id, time, quantity) VALUES ($1, $2, $3) RETURNING id;"
    values = [@stock_id, Time.now, @quantity]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE purchases SET (stock_id, time, quantity) = ($1, $2, $3) WHERE id = $4;"
    values = [@stock_id, @time, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def update_arrival_time()
    sql = "UPDATE purchases SET arrival_time = $1 WHERE id = $2;"
    values = [Time.now, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM purchases WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stock()
    Stock.find(@stock_id)
  end

  def cost()
    stock = Stock.find(@stock_id)
    cost = stock.buy_price * @quantity
    return cost
  end

  def Purchase.all()
    sql = "SELECT * FROM purchases;"
    purchase_hashes = SqlRunner.run(sql)
    purchases = purchase_hashes.map { |purchase_hash| Purchase.new(purchase_hash)}
    return purchases
  end

  def Purchase.find(id)
    sql = "SELECT * FROM purchases WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    purchase_hash = result.first()
    return Purchase.new(purchase_hash)
  end

  def Purchase.delete_all()
    SqlRunner.run("DELETE FROM purchases;")
  end

end
