require('pry-byebug')
require_relative('albums')

class Artist
  
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end
  
  
end