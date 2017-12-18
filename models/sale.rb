require_relative("../db/sql_runner")
require("date")
require("time")
require("pry-byebug")

class Sale

  attr_reader(:id, :stock_id, :date, :time, :quantity)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @stock_id = options["stock_id"].to_i() if options["stock_id"]
    @time = options["time"]
    @quantity = options["quantity"]
  end

end
