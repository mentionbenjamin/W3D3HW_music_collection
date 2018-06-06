require("pg")
require_relative("../db/sql_runner.rb")

class Artist

  attr_reader(:id, :name)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
  end

  def save()
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    db_id_result = SqlRunner.run(sql,values)
    @id = db_id_result[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)} #takes in hash of artist and we create objects from them.
  end

end
