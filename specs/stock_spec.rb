require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/stock.rb')

class TestStock < Minitest::Test

  def setup
    @stock = Stock.new({"album_id" => 1, "quantity" => 100})
  end

  def test_stock_has_album_id()
    assert_equal(1, @stock.album_id)
  end

  def test_stock_has_quantity()
    assert_equal(100, @stock.quantity)
  end

end
