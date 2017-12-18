require_relative("../db/sql_runner")
require("pry-byebug")

class Purchase

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
  end

end
