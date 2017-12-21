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

  def save()
    sql = "INSERT INTO suppliers (company, address, postcode, phone, email, website) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
    values = [@company, @address, @postcode, @phone, @email, @website]
    @id = SqlRunner.run(sql, values).first()["id"].to_i()
  end

  def update()
    sql = "UPDATE suppliers SET (company, address, postcode, phone, email, website) = ($1, $2, $3, $4, $5, $6) WHERE id = $7;"
    values = [@company, @address, @postcode, @phone, @email, @website, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    if Stock.find_all_by_supplier(@id) == []
      sql = "DELETE FROM suppliers WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
      return "The supplier \"#{@company}\" has been deleted."
    elsif Stock.find_all_by_supplier(@id)
      return "Could not delete supplier \"#{@company}\"."
    end
  end

  def Supplier.all()
    sql = "SELECT * FROM suppliers;"
    supplier_hashes = SqlRunner.run(sql)
    suppliers = supplier_hashes.map { |supplier_hash| Supplier.new(supplier_hash)}
    return suppliers
  end

  def Supplier.all_sorted()
    suppliers = Supplier.all()
    return suppliers.sort_by { |supplier| supplier.company }
  end

  def Supplier.find(id)
    sql = "SELECT * FROM suppliers WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    supplier_hash = result.first()
    return Supplier.new(supplier_hash)
  end

  def Supplier.delete_all()
    SqlRunner.run("DELETE FROM suppliers;")
  end


end
