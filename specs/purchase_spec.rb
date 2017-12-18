require("minitest/autorun")
require("minitest/rg")
require("pry-byebug")
require("time")
require_relative("../models/purchase.rb")

class TestPurchase < Minitest::Test

  def setup
    time = Time.new(2017, 12, 18, 12, 0, 0, "+00:00").to_s
    @purchase = Purchase.new({"time" => time})
  end

  def test_purchase_has_time()
    assert_equal("2017-12-18 12:00:00 +0000", @purchase.time)
  end

end
