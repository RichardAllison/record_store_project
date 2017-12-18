require("minitest/autorun")
require("minitest/rg")
require("pry-byebug")
require("time")
require_relative("../models/sale.rb")

class TestSale < Minitest::Test

  def setup
    time = Time.new(2017, 12, 18, 12, 0, 0, "+00:00").to_s
    @sale = Sale.new({"stock_id" => 8, "time" => time, "quantity" => 1})
  end

  def test_sale_has_time()
    assert_equal("2017-12-18 12:00:00 +0000", @sale.time)
  end

  def test_purchase_has_quantity()
    assert_equal(1, @sale.quantity)
  end

  def test_purchase_has_stock_id()
    assert_equal(8, @sale.stock_id)
  end

end
