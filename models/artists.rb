require('pry-byebug')
require_relative('albums')
require_relative ('../db/sql_runner')

class Artist
  
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end
  
  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def Artist.list_all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    albums = result.map { |album| Album.new(album)}
    return albums
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    results = SqlRunner.run(sql)
    artist_hash = results.first
    artist = Artist.new(artist_hash)
    return artist
  end

end