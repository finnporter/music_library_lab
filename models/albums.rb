require ('pg')
require_relative ('artists')
require_relative ('../db/sql_runner')

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i 
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i 
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def Album.list_all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    artist_data = result[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def update()
    sql = "UPDATE albums set (title, genre, artist_id) = ('#{@title}', '#{@genre}', '#{artist_id}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end
end