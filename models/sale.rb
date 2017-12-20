require("time")
require("pry-byebug")
require_relative("../db/sql_runner")

class Sale

  attr_reader(:id, :stock_id, :time, :quantity)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @stock_id = options["stock_id"].to_i() if options["stock_id"]
    @time = Time.parse(options["time"]) if options["time"]
    @quantity = options["quantity"].to_i()
    # @sale_price
  end

  def save()
    stock = Stock.find(@stock_id)
    if stock.quantity >= @quantity
      sql = "INSERT INTO sales (stock_id, time, quantity) VALUES ($1, $2, $3) RETURNING id;"
      @cost =
      stock = Stock.find(@stock_id)
      cost = stock.sell_price * @quantity
      values = [@stock_id, Time.now, @quantity]
      @id = SqlRunner.run(sql, values).first()["id"].to_i()
    else
      return "Sale unsuccessful"
    end
  end

  def update()
    sql = "UPDATE sales SET (stock_id, time, quantity) = ($1, $2, $3) WHERE id = $4;"
    values = [@stock_id, @time, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def update_stock_amount()
    if stock.quantity >= @quantity
      stock = Stock.find(@stock_id)
      stock.subtract_from_quantity(@quantity)
    end
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

  def formatted_time()
    return @time.strftime("%d/%m/%Y %T")
  end

  def Sale.all()
    sql = "SELECT * FROM sales;"
    sale_hashes = SqlRunner.run(sql)
    sales = sale_hashes.map { |sale_hash| Sale.new(sale_hash)}
    return sales
  end

  def Sale.all_sorted_by_date()
    sale_hashes = Sale.all()
    sale_hashes.sort_by { |sale_hash| sale_hash.time }.reverse
  end

  def Sale.find(id)
    sql = "SELECT * FROM sales WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    sale_hash = result.first()
    return Sale.new(sale_hash)
  end

  def Sale.total_value()
    sale_items = Sale.all()
    sale_values = sale_items.map { |sale_item| sale_item.stock.sell_price * sale_item.quantity}
    total = sale_values.reduce { |running_total, sale_value| running_total + sale_value }
    return total
  end

  def Sale.delete_all()
    SqlRunner.run("DELETE FROM sales;")
  end


end
