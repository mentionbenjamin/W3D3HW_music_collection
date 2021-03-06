require("pg")
require_relative("../db/sql_runner.rb")

class Album

  attr_reader(:id, :artist_id)
  attr_accessor(:name, :genre)

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

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)} #takes in hash of albums and we create objects from them.
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist_details = SqlRunner.run(sql,values)
    return Artist.new(artist_details[0])
  end

  def update()
    sql = "UPDATE albums SET (name, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @genre, @artist_id, @id]
    SqlRunner.run(sql,values)
  end


end
