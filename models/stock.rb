require_relative("../db/sql_runner")
require("pry-byebug")

class Stock

  attr_reader(:id, :album_id, :quantity, :low_stock_level, :high_stock_level, :buy_price, :sell_price)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @album_id = options["album_id"].to_i()
    @quantity = options["quantity"].to_i()
    @low_stock_level = options["low_stock_level"].to_i()
    @high_stock_level = options["high_stock_level"].to_i()
    if options["buy_price"].include?("£")
      @buy_price = options["buy_price"].split("£")[1].to_f()
    else
      @buy_price = options["buy_price"].to_f()
    end
    if options["sell_price"].include?("£")
      @sell_price = options["sell_price"].split("£")[1].to_f()
    else
      @sell_price = options["sell_price"].to_f
    end
  end

  def save()
    unless Stock.check_album(@album_id)
      sql = "INSERT INTO stock
      (album_id, quantity, low_stock_level, high_stock_level, buy_price, sell_price)
      VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
      values = [@album_id, @quantity, @low_stock_level, @high_stock_level, @buy_price, @sell_price]
      @id = SqlRunner.run(sql, values).first()["id"].to_i()
      return "#{@quantity} x #{album().title} has been added to Stock."
    else
      return "#{album().title} is already in Stock!"
    end
  end

  def update()
    sql = "UPDATE stock
    SET (album_id, quantity, low_stock_level, high_stock_level, buy_price, sell_price)
     = ($1, $2, $3, $4, $5, $6) WHERE id = $7;"
    values = [@album_id, @quantity, @low_stock_level, @high_stock_level, @buy_price, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def add_to_quantity(quantity)
    sql = "UPDATE stock SET quantity = $1 WHERE id = $2;"
    new_quantity = @quantity + quantity
    values = [new_quantity, @id]
    SqlRunner.run(sql, values)
  end

  def subtract_from_quantity(quantity)
    sql = "UPDATE stock SET quantity = $1 WHERE id = $2;"
    new_quantity = @quantity - quantity
    values = [new_quantity, @id]
    SqlRunner.run(sql, values)
  end

  def update_delivery_time()
    sql = "UPDATE purchases SET delivery_time = $1 WHERE id = $2;"
    values = [Time.now, @id]
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

  def markup()
    return @sell_price.to_f - @buy_price.to_f
  end

  def Stock.all()
    sql = "SELECT * FROM stock;"
    stock_hashes = SqlRunner.run(sql)
    stock = stock_hashes.map { |stock_hash| Stock.new(stock_hash)}
    return stock
  end

  def Stock.all_sorted()
    stock = Stock.all()
    return stock.sort_by { |k| k.album.title }
  end

  def Stock.find(id)
    sql = "SELECT * FROM stock WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    stock_hash = result.first()
    return Stock.new(stock_hash)
  end

  def Stock.find_by_album(album_id)
    if Stock.check_album(album_id)
      sql = "SELECT * FROM stock WHERE album_id = $1;"
      values = [album_id]
      result = SqlRunner.run(sql, values)
      stock_hash = result.first()
      stock = Stock.new(stock_hash)
      return stock.id
    end
    return "not_in_stock"
  end

  def Stock.check_album(album_id)
    stock_items = Stock.all()
    stock_album_ids = stock_items.map { |stock_item| stock_item.album_id }
    return stock_album_ids.include?(album_id)
  end

  # def Stock.latest_purchase(id)
  #   all_purchases = Purchase.all()
  #   stock_purchases = Purchase.find_stock(id)
  #   purchase_times = stock_purchases.map { |purchase| purchase.order_time }
  #   latest_purchase = purchase_times.max
  #   return latest_purchase
  # end
  #
  # def Stock.latest_delivery(id)
  #   all_purchases = Purchase.all()
  #   stock_purchases = Purchase.find_stock(id)
  #   delivery_times = stock_purchases.map { |purchase| purchase.delivery_time }
  #   latest_delivery = delivery_times.max
  #   return latest_delivery
  # end

  def Stock.total_value()
    stock_items = Stock.all()
    stock_prices = stock_items.map { |stock_item| stock_item.sell_price * stock_item.quantity}
    total = stock_prices.reduce { |running_total, stock_price| running_total + stock_price }
    return total
  end

  def Stock.total_markup()
    stock_items = Stock.all()
    stock_prices = stock_items.map { |stock_item| stock_item.markup * stock_item.quantity}
    total = stock_prices.reduce { |running_total, stock_price| running_total + stock_price }
    return total
  end

  def Stock.delete_all()
    SqlRunner.run("DELETE FROM stock;")
  end

  def level()
    stock = Stock.find(@id)
    stock_level = @quantity
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
