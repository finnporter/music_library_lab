require('pry-byebug')
require_relative('../models/albums')
require_relative('../models/artists')


artist1 = Artist.new("name" => "Psy")
artist2 = Artist.new("name" => "Nirvana")

album1 = Album.new(
  "title" => "Psy 6",
  "genre" => "pop"
  )
album2 = Album.new(
  "name" => "Nevermind",
  "genre" => "grunge"
  )

artist1.save()
artist2.save()

album1.save()
album2.save()


binding.pry
nil