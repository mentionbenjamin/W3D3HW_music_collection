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

  def save()
    sql = "INSERT INTO albums
    (name, genre, artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@name, @genre, @artist_id]
    db_id_result = SqlRunner.run(sql,values)
    @id = db_id_result[0]["id"].to_i()
  end

end
