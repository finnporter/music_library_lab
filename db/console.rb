require('pry-byebug')
require_relative('../models/albums')
require_relative('../models/artists')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new("name" => "Psy")
artist2 = Artist.new("name" => "Nirvana")

artist1.save()
artist2.save()

album1 = Album.new(
  "title" => "Psy 6",
  "genre" => "pop",
  "artist_id" => artist1.id
  )
album2 = Album.new(
  "name" => "Nevermind",
  "genre" => "grunge",
  "artist_id" => artist2.id
  )



album1.save()
album2.save()


binding.pry
nil