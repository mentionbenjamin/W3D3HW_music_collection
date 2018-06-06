require("pg")
require_relative("../db/sql_runner.rb")

class Album

  attr_reader(:id, :name, :genre, :artist_id)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @genre = details["genre"]
    @artist_id = details["artist_id"].to_i()
  end

end
