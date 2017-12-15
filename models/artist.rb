require_relative("../db/sql_runner")
require("pry-byebug")

class Artist

  attr_reader(:id, :name, :type)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @type = options["type"]
  end

end
