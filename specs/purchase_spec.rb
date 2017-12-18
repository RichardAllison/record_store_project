require("minitest/autorun")
require("minitest/rg")
require("pry-byebug")
require("time")
require_relative("../models/purchase.rb")

class TestPurchase < Minitest::Test

  def setup
    time = Time.new(2017, 12, 18, 12, 0, 0, "+00:00").to_s
    @purchase = Purchase.new({"stock_id" => 1, "time" => time, "quantity" => 10})
  end

  def test_purchase_has_time()
    assert_equal("2017-12-18 12:00:00 +0000", @purchase.time)
  end

  def test_purchase_has_quantity()
    assert_equal(10, @purchase.quantity)
  end

  def test_purchase_has_stock_id()
    assert_equal(1, @purchase.stock_id)
  end

end
