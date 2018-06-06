require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Joe"
  })
artist1.save()

artist2 = Artist.new({
  "name" => "Bill"
  })
artist2.save()

album1 = Album.new({
  "name" => "Highland",
  "genre" => "folk",
  "artist_id" => artist1.id()
  })
album1.save()

album2 = Album.new({
  "name" => "Inside",
  "genre" => "New metal",
  "artist_id" => artist1.id()
  })
album2.save()

album3 = Album.new({
  "name" => "Do woop",
  "genre" => "Swing",
  "artist_id" => artist2.id()
  })
album3.save()




binding.pry
nil
