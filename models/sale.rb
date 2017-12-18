require_relative("../db/sql_runner")
require("pry-byebug")

class Sale

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
  end

end
