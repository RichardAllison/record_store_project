require("time")
require("pry-byebug")
require_relative("../db/sql_runner")

class Sale

  attr_reader(:id, :stock_id, :time, :quantity, :checkout)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @stock_id = options["stock_id"].to_i() if options["stock_id"]
    @time = options["time"]
    @quantity = options["quantity"].to_i()
      @checkout = options["checkout"] || []
  end

  def save()
    sql = "INSERT INTO sales (stock_id, time, quantity) VALUES ($1, $2, $3) RETURNING id;"
    values = [@stock_id, Time.now, @quantity]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def add_to_checkout(stock_item)
    @checkout << stock_item
  end

  def save_checkout()
    for item in @checkout
      item.save()
    end

  end

  def update()
    sql = "UPDATE sales SET (stock_id, time, quantity) = ($1, $2, $3) WHERE id = $4;"
    values = [@stock_id, @time, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sales WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stock()
    Stock.find(@stock_id)
  end

  def cost()
    stock = Stock.find(@stock_id)
    cost = stock.sell_price * @quantity
    return cost
  end

  def Sale.all()
    sql = "SELECT * FROM sales;"
    sale_hashes = SqlRunner.run(sql)
    sales = sale_hashes.map { |sale_hash| Sale.new(sale_hash)}
    return sales
  end

  def Sale.find(id)
    sql = "SELECT * FROM sales WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    sale_hash = result.first()
    return Sale.new(sale_hash)
  end

  def Sale.delete_all()
    SqlRunner.run("DELETE FROM sales;")
  end


end
