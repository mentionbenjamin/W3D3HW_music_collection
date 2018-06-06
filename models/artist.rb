require("pg")
require_relative("../db/sql_runner.rb")

class Artists

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
  end

end
