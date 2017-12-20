require("time")
require("pry-byebug")
require_relative("../db/sql_runner")

class Purchase

  attr_reader(:id, :stock_id, :order_time, :quantity, :delivery_time)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @stock_id = options["stock_id"].to_i() if options["stock_id"]
    @order_time = Time.parse(options["order_time"]) if options["order_time"]
    @quantity = options["quantity"].to_i()
    @delivery_time = Time.parse(options["delivery_time"]) if options["delivery_time"]
  end

  def save()
    sql = "INSERT INTO purchases (stock_id, order_time, quantity) VALUES ($1, $2, $3) RETURNING id;"
    values = [@stock_id, Time.now, @quantity]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE purchases SET (stock_id, order_time, quantity) = ($1, $2, $3) WHERE id = $4;"
    values = [@stock_id, @order_time, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def update_delivery_time()
    sql = "UPDATE purchases SET delivery_time = $1 WHERE id = $2;"
    values = [Time.now, @id]
    SqlRunner.run(sql, values)
  end

  def update_stock_amount()
    stock = Stock.find(@stock_id)
    stock.add_to_quantity(@quantity)
  end

  def delete()
    sql = "DELETE FROM purchases WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stock()
    Stock.find(@stock_id)
  end

  def formatted_order_time()
    return @order_time.strftime("%d/%m/%Y %T")
  end

  def formatted_delivery_time()
    return @delivery_time.strftime("%d/%m/%Y %T")
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

  def Purchase.all_sorted_by_date()
    purchase_hashes = Purchase.all()
    purchase_hashes.sort_by { |purchase_hash| purchase_hash.order_time }.reverse
  end

  def Purchase.find(id)
    sql = "SELECT * FROM purchases WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    purchase_hash = result.first()
    return Purchase.new(purchase_hash)
  end

  def Purchase.find_stock(stock_id)
    sql = "SELECT * FROM purchases WHERE stock_id = $1;"
    values = [stock_id]
    purchase_hashes = SqlRunner.run(sql, values)
    purchases = purchase_hashes.map { |purchase_hash| Purchase.new(purchase_hash)}
    return purchases
  end

  def Purchase.total_value()
    purchase_items = Purchase.all()
    purchase_values = purchase_items.map { |purchase_item| purchase_item.stock.sell_price * purchase_item.quantity}
    total = purchase_values.reduce { |running_total, purchase_value| running_total + purchase_value }
    return total
  end

  def Purchase.delete_all()
    SqlRunner.run("DELETE FROM purchases;")
  end

end
