require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

artist1 = Artist.new({
  "name" => "Joe"
  })

artist1.save()

album1 = Album.new({
  "name" => "Highland",
  "genre" => "folk",
  "artist_id" => artist1.id()
  })

binding.pry
nil
