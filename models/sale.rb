require("time")
require("pry-byebug")
require_relative("../db/sql_runner")

class Sale

  attr_reader(:id, :stock_id, :time, :quantity)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @stock_id = options["stock_id"].to_i() if options["stock_id"]
    @time = options["time"]
    @quantity = options["quantity"]
  end

end
