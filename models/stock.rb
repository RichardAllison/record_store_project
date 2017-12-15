require_relative("../db/sql_runner")
require("pry-byebug")

class Stock

  attr_reader(:id, :album_id, :quantity)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @album_id = options["album_id"]
    @quantity = options["quantity"].to_i()
  end

end
