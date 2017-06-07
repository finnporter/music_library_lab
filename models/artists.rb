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

end