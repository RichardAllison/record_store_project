require_relative("../db/sql_runner")
require("pry-byebug")

class Supplier

  attr_reader(:id, :company, :address, :postcode, :phone, :email, :website)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @company = options["company"]
    @address = options["address"]
    @postcode = options["postcode"]
    @phone = options["phone"]
    @email = options["email"]
    @website = options["website"]
  end

end
