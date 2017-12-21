require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../models/supplier.rb')

class TestSupplier < Minitest::Test

  def test_supplier_has_company()
    supplier = Supplier.new({"company" => "Test Company"})
    assert_equal("Test Company", supplier.company)
  end

end
