require ('pg')
require_relative ('artists')

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i 
  end




end