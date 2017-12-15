require_relative("../db/sql_runner")
require("pry-byebug")

class Genre

  attr_reader(:id, :name)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO genres (name) VALUES ($1) RETURNING id;"
    values = [@name]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

end
